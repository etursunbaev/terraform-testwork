provider "aws" {
  region = var.aws_region
}
locals {
  cluster_name       = "${var.prefix_name}-${var.environment}-${var.cluster_name}"
  service_name       = "${var.prefix_name}-${var.environment}-${var.service_name}"
  unique_name        = "${var.prefix_name}-${var.environment}-${var.unique_name}"
  launch_config_name = "${var.prefix_name}-${var.environment}-${var.launch_config_name}"
  asg_name           = "${var.prefix_name}-${var.environment}-${var.asg_name}"
  pub_key_name       = "${var.prefix_name}-${var.environment}-key"
}
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
data "aws_ami" "ecs_ami" {
  most_recent = true
  owners      = [var.ami_owner]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-2.0*"]
  }
}
data "template_file" "user_data" {
  template = file("scripts/${var.default_user_data_template_file}")

  vars = {
    ecs_cluster_name = local.cluster_name
  }
}
data "aws_instances" "this_instance" {
  instance_tags = {
    Environment = var.environment
    #Name = "*asg*"
  }
}
resource "aws_key_pair" "pub_key" {
  key_name   = local.pub_key_name
  public_key = var.public_key
  tags = merge(var.additional_tags, {
    Name        = local.pub_key_name
    Environment = var.environment
    },
  )
}
module "md-asg" {
  source                  = "./modules/asg-tfm"
  prefix_name             = var.prefix_name
  environment             = var.environment
  launch_config_name      = local.launch_config_name
  asg_name                = local.asg_name
  asg_max_size            = var.asg_max_size
  asg_min_size            = var.asg_min_size
  subnets                 = data.aws_subnets.subnets.ids
  instance_profile        = module.md-ecs.iam_instance_profile_name
  instance_type           = var.instance_type
  pub_key_name            = aws_key_pair.pub_key.key_name
  root_vol_size           = var.root_vol_size
  root_vol_type           = var.root_vol_type
  image_id                = data.aws_ami.ecs_ami.image_id != "" ? data.aws_ami.ecs_ami.image_id : var.image_id
  user_data_template_file = var.user_data != "" ? var.user_data : data.template_file.user_data.rendered
  additional_tags         = var.additional_tags
}
module "md-ecs" {
  source          = "./modules/ecs-tfm"
  cluster_name    = local.cluster_name
  service_name    = local.service_name
  unique_name     = local.unique_name
  additional_tags = var.additional_tags
}
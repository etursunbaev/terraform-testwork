provider "aws" {
  region = var.aws_region
}
locals {
  cluster_name = "${var.prefix_name}-${var.environment}-${var.cluster_name}"
}
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
data "aws_ami" "ecs_ami" {
  most_recent      = true
  owners           = [var.ami_owner]

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

module "md-asg" {
  source             = "./modules/asg-tfm"
  prefix_name        = var.prefix_name
  environment        = var.environment
  asg_max_size       = var.asg_max_size
  asg_min_size       = var.asg_min_size
  subnets            = data.aws_subnets.subnets.ids
  instance_type     = var.instance_type
  pub_key_name      = var.pub_key_name
  root_vol_size     = var.root_vol_size
  root_vol_type     = var.root_vol_type
  image_id = data.aws_ami.ecs_ami.image_id != "" ? data.aws_ami.ecs_ami.image_id : var.image_id
  user_data_template_file = var.user_data != "" ? var.user_data : data.template_file.user_data.rendered
}
module "md-ecs" {
  source = "./modules/ecs-tfm"
  cluster_name = local.cluster_name
}
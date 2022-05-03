provider "aws" {
  region = var.aws_region
}
locals {
  pub_key_name = "${var.prefix_name}-${var.environment}-key"
}
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  tags = {
    "Name" = "*public*"
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
    ecs_cluster_name = module.md-ecs.cluster_name
  }
}
data "aws_instances" "this_instance" {
  instance_tags = {
    Environment = var.environment
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
module "md-iam" {
  source          = "./modules/iam-tfm"
  environment     = var.environment
  prefix_name     = var.prefix_name
  additional_tags = var.additional_tags
}
module "md-sg" {
  source          = "./modules/sg-tfm"
  additional_tags = var.additional_tags
  vpc_id          = var.vpc_id
  prefix_name     = var.prefix_name
  environment     = var.environment
  ingress_rules   = var.ingress_rules
  egress_rules    = var.egress_rules
  create_sg       = var.create_sg
}
module "md-asg" {
  source                  = "./modules/asg-tfm"
  prefix_name             = var.prefix_name
  environment             = var.environment
  asg_max_size            = var.asg_max_size
  asg_min_size            = var.asg_min_size
  subnets                 = data.aws_subnets.subnets.ids
  instance_profile        = module.md-iam.instance_profile_name
  instance_type           = var.instance_type
  pub_key_name            = aws_key_pair.pub_key.key_name
  root_vol_size           = var.root_vol_size
  root_vol_type           = var.root_vol_type
  image_id                = data.aws_ami.ecs_ami.image_id != "" ? data.aws_ami.ecs_ami.image_id : var.image_id
  user_data_template_file = var.user_data != "" ? var.user_data : data.template_file.user_data.rendered
  additional_tags         = var.additional_tags
  security_groups = [module.md-sg.sg_id]
}
module "md-ecs" {
  source                  = "./modules/ecs-tfm"
  additional_tags         = var.additional_tags
  desired_count           = var.asg_min_size
  prefix_name             = var.prefix_name
  environment             = var.environment
  create_ecs              = true
  ecs_task_execution_role = module.md-iam.ecsTaskExecutionRole_arn
}
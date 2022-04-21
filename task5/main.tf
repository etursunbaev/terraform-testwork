provider "aws" {
  region = var.aws_region
}
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
module "md-asg_launch_conf" {
  source            = "./modules/launch-config-tfm"
  os_platform_name  = var.os_platform_name
  os_platform_owner = var.os_platform_owner
  prefix_name       = var.prefix_name
  environment       = var.environment
  instance_type     = var.instance_type
  pub_key_name      = var.pub_key_name
  root_vol_size     = var.root_vol_size
  root_vol_type     = var.root_vol_type
}
module "md-asg" {
  source             = "./modules/asg-tfm"
  prefix_name        = var.prefix_name
  environment        = var.environment
  asg_max_size       = var.asg_max_size
  asg_min_size       = var.asg_min_size
  launch_config_name = module.md-asg_launch_conf.launch_configuration_name
  subnets            = data.aws_subnets.subnets.ids
}
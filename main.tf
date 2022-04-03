provider "aws" {
  #required_version = "0.13"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  region = var.aws_region
}

module "my_ssh_key" {
  source = "./modules/my_ssh_key"
  my_pub_key = var.my_pub_key
}

module "my_sg" {
  source = "./modules/my_sg"
}

module "my_ec2" {
  count = var.items_count  
  source                 = "./modules/my_ec2"
  key_name               = module.my_ssh_key.key_name
  vpc_security_group_ids = [module.my_sg.ssh_sg_id, module.my_sg.web_sg_id, module.my_sg.out_sg_id]
  instance_name = format("${var.instance_name}-%03d", count.index + 1)
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  your_first_name = var.your_first_name
  your_last_name = var.your_last_name
  os_platform_name = var.os_platform_name
  os_platform_owner = var.os_platform_owner
  instance_user = var.instance_user
}
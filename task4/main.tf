provider "aws" {
  region = var.aws_region
}
locals {
  username = lookup(var.instance_user, var.os_platform_owner)
}
data "aws_vpc" "vpc" {
  id = var.vpc_id != "" ? var.vpc_id : var.default_vpc_id
}
data "aws_subnet" "subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id != "" ? var.vpc_id : var.default_vpc_id]
  }
  filter {
    name   = "availability-zone"
    values = [var.vpc_az]
  }
  tags = {
    "Name" = "*public*"
  }
}
data "aws_ami" "os_platform" {
  owners      = [var.os_platform_owner]
  most_recent = true

  filter {
    name   = "name"
    values = [var.os_platform_name]
  }
}
module "md-sg" {
  source          = "./modules/sg-tfm"
  create_sg       = var.create_sg
  prefix_name     = var.prefix_name
  sg_description  = var.sg_description
  environment     = var.environment
  vpc_id          = data.aws_vpc.vpc.id
  additional_tags = var.additional_tags
  ingress_rules   = var.ingress_rules
  egress_rules    = var.egress_rules
}
module "md-ec2" {
  source   = "./modules/ec2-tfm"
  for_each = var.project

  tls_algorithm           = each.value.tls_algorithm != "" ? each.value.algorithm : var.tls_algorithm
  tls_bits                = each.value.tls_bits != null ? each.value.tls_bits : var.tls_bits
  pub_key_name            = format("${var.prefix_name}-${each.key}-%s", var.pub_key_name)
  additional_tags         = var.additional_tags
  prefix_name             = each.value.prefix_name != "" ? each.value.prefix_name : var.prefix_name
  environment             = each.value.environment != "" ? each.value.environment : var.environment
  instance_count          = each.value.instance_count != null ? each.value.instance_count : var.instance_count
  ami_id                  = data.aws_ami.os_platform.image_id
  instance_type           = each.value.instance_type != "" ? each.value.instance_type : var.instance_type
  vpc_security_group_ids  = [module.md-sg.sg_id]
  subnet_id               = data.aws_subnet.subnet.id
  your_first_name         = each.value.first_name != "" ? each.value.first_name : var.your_first_name
  your_last_name          = each.value.last_name != "" ? each.value.last_name : var.your_last_name
  instance_name           = each.key
  user_data_template_file = file("scripts/${var.user_data_template_file}")
  root_block_device_size  = each.value.root_vol_size != "" ? each.value.root_vol_size : var.root_block_device_size
  root_block_device_type  = each.value.root_vol_type != "" ? each.value.root_vol_type : var.root_block_device_type
}
data "template_file" "check_user-data" {
  template = file("scripts/${var.check_user_data_template_file}")
}
data "template_file" "print_cmd" {
  template = file("scripts/${var.print_cmd_template_file}")
}

resource "null_resource" "remote_print" {
  for_each = module.md-ec2
  connection {
    type        = "ssh"
    user        = local.username
    private_key = each.value.priv_key_pem[0]
    host        = each.value.instance_public_ip[0]
  }
  provisioner "remote-exec" {
    inline = [data.template_file.check_user-data.rendered]
  }
  provisioner "remote-exec" {
    inline = [data.template_file.print_cmd.rendered]
  }
}
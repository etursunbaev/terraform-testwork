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
        name = "availability-zone"
        values = [var.vpc_az]
    }
}
data "aws_ami" "os_platform" {
    owners = [var.os_platform_owner]
    most_recent = true

    filter {
        name = "name"
        values = [var.os_platform_name]
    }
}
module "md-sg" {
    source = "./modules/sg-tfm"
    create_sg = var.create_sg
    prefix_name = var.prefix_name
    sg_description = var.sg_description
    environment = var.environment
    vpc_id = data.aws_vpc.vpc.id
    additional_tags = var.additional_tags
    ingress_rules = var.ingress_rules
    egress_rules = var.egress_rules
}
module "md-ec2" {
    source = "./modules/ec2-tfm"
    tls_algorithm = var.tls_algorithm
    tls_rsa_bits = var.tls_rsa_bits
    pub_key_name = var.pub_key_name
    additional_tags = var.additional_tags
    prefix_name = var.prefix_name
    environment = var.environment
    instance_count = var.instance_count
    ami_id = data.aws_ami.os_platform.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [module.md-sg.sg_id]
    subnet_id = data.aws_subnet.subnet.id
    your_first_name = var.your_first_name
    your_last_name = var.your_last_name
    instance_name = var.instance_name
    user_data_template_file = "${file("scripts/${var.user_data_template_file}")}"
}
data "template_file" "check_user-data" {
    template = "${file("scripts/${var.check_user_data_template_file}")}"
}
data "template_file" "print_cmd" {
    template = "${file("scripts/${var.print_cmd_template_file}")}"
}

resource "null_resource" "remote_print" {
    count = var.instance_count > 0 ? var.instance_count : 0
    connection {
        type = "ssh"
        user = local.username
        private_key = module.md-ec2.priv-key-pem
        host = module.md-ec2.instance_public_ip[count.index]
    }
    provisioner "remote-exec" {
        inline = [data.template_file.check_user-data.rendered]
    
    }
    provisioner "remote-exec" {
        inline = [data.template_file.print_cmd.rendered]
    }
}
provider "aws" {
    access_key = var.your_aws_access_key_id
    secret_key = var.your_aws_secret_access_key
    region = var.aws_region
}
locals {
    username = lookup(var.instance_user, var.os_platform_owner)
    common_tags = {
        Department = var.departament_name
        ManagedByTerraform = "True"
        Environment = var.environment
    }
}

data "aws_caller_identity" "current" {}
data "aws_ami" "os_platform" {
    owners = [var.os_platform_owner]
    most_recent = true

    filter {
        name = "name"
        values = [var.os_platform_name]
    }
}
data "aws_security_groups" "sg_id" {
    filter {
        name   = "vpc-id"
        values = [var.vpc_id]
    }  
}
data "aws_vpc" "my_vpc" {
    id = var.vpc_id
}
data "aws_subnet" "my_subnet" {
    filter {
        name   = "vpc-id"
        values = [var.vpc_id]
    }
    filter {
        name = "availability-zone"
        values = [var.vpc_az]
    }
}
############################ Resources
resource "aws_instance" "server" {
    count = var.create && var.pub_key_name != "" ? var.instance_count : 0
    ami = data.aws_ami.os_platform.image_id
    instance_type = var.instance_type
    key_name = var.pub_key_name
    vpc_security_group_ids = var.vpc_security_group_ids
    subnet_id = tostring(data.aws_subnet.my_subnet.id)
    metadata_options {
        instance_metadata_tags = "enabled"
        http_endpoint = "enabled"
    }
    tags = merge(local.common_tags,{
        Name = format("${var.prefix_name}-${var.environment}-${var.instance_name}-%03d", count.index + 1)
        Date_creation = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
        OS_type = data.aws_ami.os_platform.platform_details
        Your_First_Name = var.your_first_name
        Your_Last_Name = var.your_last_name
        AWS_Account_ID = data.aws_caller_identity.current.account_id
        },
    )
  
    user_data = file("${path.module}/init.tftpl")
    provisioner "file" {
        content = "SUCCESS"
        destination = "/tmp/success.txt"
        connection {
            type = "ssh"
            user =local.username
            private_key = var.path_priv_key
            host = self.public_ip
        }
    }

    provisioner "remote-exec" {
        inline = [
            "cat /tmp/success.txt"
        ]
        connection {
            type = "ssh"
            user = local.username
            private_key = var.path_priv_key
            host = self.public_ip
        }
    }
}
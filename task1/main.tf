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
data "aws_caller_identity" "current" {}
data "aws_ami" "os_platform" {
    owners = [var.os_platform_owner]
    most_recent = true

    filter {
        name = "name"
        values = [var.os_platform_name]
    }
}
data "http" "my_ip" {
    url = var.data_http_ip_url
}
############################ Resources
resource "aws_key_pair" "my_key" {
    key_name   = "${var.prefix_name}-${var.environment}-key"
    public_key = file("${var.my_pub_key}")
    tags = merge(local.common_tags,{
        Name = "${var.prefix_name}-${var.environment}-key"
        },
    )
}
resource "aws_security_group" "my_sg" {
    name = "Allow http/ssh"
    description = "Allow inbound SSH from my home IP address"
    vpc_id = data.aws_vpc.my_vpc.id
    tags = merge(local.common_tags,{
        Name = "${var.prefix_name}-${var.environment}-sg"
        },
    )
    ingress {
        description      = "SSH from my home IP"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["${chomp(data.http.my_ip.body)}/32"]
    }

    ingress {
        description      = "HTTP from home IP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["${chomp(data.http.my_ip.body)}/32"]
    }

    egress {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "Open internet"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "my_Instance" {
    count = (var.items_count != "" ? var.items_count : 1 )
    ami = data.aws_ami.os_platform.image_id
    instance_type = var.instance_type
    key_name = aws_key_pair.my_key.key_name
    vpc_security_group_ids = [aws_security_group.my_sg.id]
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
        source = "${path.module}/samplefile.txt"
        destination = "/home/${local.username}/samplefile.txt"
        connection {
            type = "ssh"
            user =local.username
            private_key =  file("${var.path_priv_key}")
            host = self.public_ip
        }
    }

    provisioner "remote-exec" {
        inline = [
            "cat ~/samplefile.txt"
        ]
        connection {
            type = "ssh"
            user = local.username
            private_key =  file("${var.path_priv_key}")
            host = self.public_ip
        }
    }
}
# My Terraform

## Description

This Terraform module creates AWS EC2 instance and with user-data provisions

## User-Data
User-data installs apache2 web server, provisions simple html page with tags information retrieved from instance meta-data

## Variables
Variables are configured in `variables.tf` file with default or empty values. You should use own values in `terraform.tfvars` file
```
your_first_name = "First Name"
your_last_name = "Last Name"
environment = ["test", "dev", "master", "prod"]
items_count = 1
my_pub_key = "~/.ssh/id_rsa.pub"
instance_type = "t2.micro"
availability_zone = "us-east-1c"
instance_name = "srv"
instance_user = "ec2-user"
os_platform_owner = "amazon"
os_platform_name = "amzn2-ami-kernel-5.10-hvm*-x86_64-gp2"
```

## Backend
Backend for tfstate file is configured to use s3 bucket. Please, change to your own s3 bucket name if it is not shared infrastructure.


# EC2 Terraform module

## Description

This simple Terraform module creates following resources:
- SSH Key-Pair
- Security group with 22,80 ingress and egress rules 
- AWS EC2 instance and with user-data provisions

## User-Data
User-data installs apache2 web server, provisions simple html page with tags information retrieved from instance meta-data

## Variables
Variables are configured in `variables.tf` file with default or empty values. You should use own values in `terraform.tfvars` file

| Name | Type | Description | Default value |
|-|-|-|-|
| my_pub_key | string | Path to your public key. | - |
| instance_type | string | Instance type to be provisioned. | t2.micro |
| vpc_az | string | The Availabilty Zone to start the instance in. | us-east-1c |
| instance_name | string | Your Instance name. | server |
| your_first_name | string | Your first name to be used in environment configuration. | - |
| your_last_name | string | Your last name to be used in environment configuration. | - |
| items_count | number | The count of instances to be created. By default one will be created. | 1 |
| instance_user | map(string) | The EC2 instance user to be used for ssh in. |  "amazon" = "ec2-user" "ubuntu" = "ubuntu" |
| os_platform_name | string | The EC2 AMI owner to be used in data filter search. | amzn2-ami-kernel-5.10-hvm*-x86_64-gp2 |
| os_platform_owner | string | The EC2 AMI name to be used in data filter search. | amazon |
| data_http_ip_url | string | Public resource to retrieve your home network ip | - |
| path_priv_key | string | Path to your private ssh key to be used in provision connection. | - |
| environment | string | The environment name to be used. | dev |
| departament_name | string | The departament name. | IT |
| vpc_id | string | The VPC id to be used in environment. | - |
| prefix_name | string | The prefix name to be used in namings. | - |
| aws_region | string | The AWS region to be used in. | us-east-1 |
| your_aws_access_key_id | string | Your AWS_ACCESS_KEY_ID to be used by terraform. | - |
| your_aws_secret_access_key | string | Your AWS_SECRET_ACCESS_KEY to be used by terraform. | - |

## Backend
Backend for tfstate file is configured to use s3 bucket. Please, change to your own s3 bucket name if it is not shared infrastructure.


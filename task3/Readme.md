# EC2 Terraform module

## Description

This Terraform module creates following resources via modules:
- md-sg
- md-ec2 
And provisions `null_resouce` to check and print file content.

## Variables
Variables are configured in `variables.tf` file with default or empty values. You should use own values in `your_terraform_filename.tfvars` file

| Name | Type | Description | Default value |
|-|-|-|-|
| create_sg | bool | Weather to create security groups. | true |
| additional_tags | map(string) | Common Tags to be merged with main tags. | {} |
| sg_description | string | Description of security group. | Security Group managed by Terraform team. |
| ingress_rules | list(map(any)) | List of ingress rules to create. | [] |
| egress_rules | list(map(any)) | List of egress rules to create. | [] |
| pub_key_name | string | The public KeyPair name to create. |-|
| instance_type | string | Instance type to be provisioned. | t2.micro |
| vpc_az | string | The Availabilty Zone to start the instance in. | us-east-1c |
| instance_name | string | Your Instance name. | server |
| your_first_name | string | Your first name to be used in environment configuration. |-|
| your_last_name | string | Your last name to be used in environment configuration. |-|
| instance_count | number | The count of instances to be created. By default one will be created. | 1 |
| instance_user | map(string) | The EC2 instance user to be used for ssh in. |  "amazon" = "ec2-user" "ubuntu" = "ubuntu" |
| os_platform_name | string | The EC2 AMI owner to be used in data filter search. | amzn2-ami-kernel-5.10-hvm*-x86_64-gp2 |
| os_platform_owner | string | The EC2 AMI name to be used in data filter search. | amazon |
| environment | string | The environment name to be used. | test |
| vpc_id | string | The VPC id to be used in environment. |-|
| default_vpc_id | string | Default VPC id if other is not set. |-|
| prefix_name | string | The prefix name to be used in namings. |-|
| check_user_data_template_file | string | Check User-Data template file. |-|
| print_cmd_template_file | string | The print to stdout template bash file |-|
| user_data_template_file | string | User-Data template file. |-|
| tls_algorithm | string | TLS Private Key algorithm type. | RSA |
| tls_rsa_bits | number | TLS RSA Bits | 4096 |

## Outputs
| Name | Description |
|-|-|
| SG-ID | Security Group ID. |
| SGRule-ID | Security Group rules IDs. |
| Instance_Public_IP | EC2 Instances Public IP address. |
| Instance_Private_IP | EC2 Instances Private IP address. |
| Null_Resource_ID | Null Resource ID only. |

## Backend
Backend for tfstate file is configured to use s3 bucket. Please, change to your own s3 bucket name if it is not shared infrastructure.


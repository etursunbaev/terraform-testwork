# EC2 Terraform module

## Description

This simple Terraform module creates following resources:
- SSH Key-Pair
- AWS EC2 instance and with user-data provisions

## User-Data
User-data installs apache2 web server, creates some files to be provisioned.

## Variables
Variables are configured in `variables.tf` file with default or empty values. You should use own values in `your_terraform_filename.tfvars` file

| Name | Description | Type | Default value |
|-|-|-|-|
| additional_tags | Common Tags to be merged with main tags. | map(string) | {} |
| user_data_template_file | User-Data template filename | string | - |
| tls_algorithm | TLS Private Key algorithm type | string | RSA |
| tls_rsa_bits | TLS RSA Bits | number | 4096 |
| pub_key_name | The public KeyPair name. | string |-|
| prefix_name | The prefix name to be used in namings. | string | my |
| environment | The environment name to be used. | string | test |
| instance_count | The count of instances to be created. | number | 1 |
| ami_id | The AMI id to be used. | string |-|
| vpc_security_group_ids | VPC Security Group ID. | list(string) | [] |
| subnet_id | The VPC subnet ID. | string |-|
| instance_name | Your Instance name. | string | server |
| instance_type | The default instance type to be used in. | string | t2.micro |
| your_first_name | Your first name to be used in environment configuration. | string |-|
| your_last_name | Your last name to be used in environment configuration. | string |-|
| root_block_device_size | The Root Block Device volume size to create. | number | 8 |
| root_block_device_type | The Root Block Device volume type to create. | string | gp2 |

## Outputs
| Name | Description |
|-|-|
| instance_public_ip | EC2 Instance Public IP address. |
| instance_private_ip | EC2 Instance Private IP address. |
| priv-key-pem | The Private key data in PEM (insecured). |
| pub-key-openssh | Public key data in Authourized files format. |

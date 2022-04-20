# SG Terraform module

## Description

This simple Terraform module creates following resources:
- Security Groups
- Security ingress and egress group rules 

## Variables
Variables are configured in `variables.tf` file with default or empty values. You should use own values in `your_terraform_filename.tfvars` file

| Name | Description| Type | Default value |
|-|-|-|-|
| additional_tags | Common Tags to be merged with main tags. |  map(string) | {} |
| create_sg | Whether to create security group. | bool | true |
| prefix_name | The prefix name to be used in namings. | string | my |
| environment | The environment name to be used. | string | test |
| sg_description | The default Security Group description. |  string | Common Security Group |  
| revoke_rules_on_delete | Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. Enable for EMR. |bool | false |
| ingress_rules | List of ingress rules to create. | list(map(any)) | [] |
| egress_rules | List of egress rules to create. |  list(map(any)) | [] |
| vpc_id | The VPC id to be used in environment. |  string |-|
| default_vpc_id | The default VPC id if other is not set.|  string |-|

## Outputs
| Name | Description |
|-|-|
| sg_id | Security Groups ID's. |
| sgrule_id | Security Group rules IDs. |

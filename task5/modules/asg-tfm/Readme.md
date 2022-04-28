# The ASG module

This module is intended to create Auto-Scaling Group.

## Variables

| Name | Description | Type | Default value |
|-|-|-|-|
| prefix_name | The prefix name to use in configuration. | string |-|
| environment | The environment name to use in configuration. | string |-|
| asg_max_size | The maximum size of the Auto Scaling Group. | number | 2 |
| asg_min_size | The minimum size of the Auto Scaling Group. | number | 1 |
| subnets | A list of subnet IDs to launch resources in.| list(any) | [] |
| instance_type | The EC2 instance type to use. | string | t2.micro |
| pub_key_name | The public KeyPair name. | string |-|
| root_vol_size | The root block device size in Gb. | number | 8 |
| root_vol_type | The root block device type. | string | gp3 |
| image_id | The EC2 image ID to launch. | string |-|
| default_image_id | Default AMI ID if image_id is unknown. | string | ami-0f260fe26c2826a3d |
| user_data_template_file | User-Data template filename | string |-|
| instance_profile | IAM Instance profile name | string |-|
| additional_tags | Common Tags to be merged with main tags. | map(string) | {} |

## Outputs

| Name | Description |
|-|-|
| asg_id | Auto-Scaling Group ID. |
| asg_name | Auto-Scaling Group name. |
| launch_configuration_name | The Launch Configuration name. |
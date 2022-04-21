# AWS Auto-Scaling Group Launch Configuration module

This module creates the Launch Configuration to use for autoscaling group.

## Variables

| Name | Description | Type | Default value |
|-|-|-|-|
| os_platform_owner | The platform owner to use in image search. | string | amazon |
| os_platform_name | The image pattern to use in filter search. | string | amzn2-ami-kernel-5.10-hvm*-x86_64-gp2 |
| instance_type | The EC2 instance type to use. | string | t2.micro |
| prefix_name | The prefix name to use in configuration. | string |-|
| environment | The environment name to use in configuration. | string |-|
| pub_key_name | The public KeyPair name. | string |-|
| root_vol_size | The root block device size in Gb. | number | 8 |
| root_vol_type | The root block device type. | string | gp3 |
| image_id | The EC2 image ID to launch. | string |-|

## Outputs

| Name | Description |
|-|-|
| launch_configuration_name | The Launch Configuration name. |
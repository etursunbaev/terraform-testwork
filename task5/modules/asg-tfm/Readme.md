# The ASG module

This module is intended to create Auto-Scaling Group.

## Variables

| Name | Description | Type | Default value |
|-|-|-|-|
| prefix_name | The prefix name to use in configuration. | string |-|
| environment | The environment name to use in configuration. | string |-|
| asg_max_size | The maximum size of the Auto Scaling Group. | number | 2 |
| asg_min_size | The minimum size of the Auto Scaling Group. | number | 1 |
| launch_config_name | The Launch Configuration name to use in ASG. | string |-|
| instance_type | The EC2 instance type to use. | string | t2.micro |
| pub_key_name | The public KeyPair name. | string |-|
| root_vol_size | The root block device size in Gb. | number | 8 |
| root_vol_type | The root block device type. | string | gp3 |
| image_id | The EC2 image ID to launch. | string |-|
## Outputs

| Name | Description |
|-|-|
| asg_id | ASG ID. |
| launch_configuration_name | The Launch Configuration name. |
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
## Outputs

| Name | Description |
|-|-|
| asg_id | ASG ID. |
# IAM terraform module for ECS

This module creates roles and policies for ECS module.
## Inputs
| Name | Description | Type | Default |
|-|-|-|-|
| prefix_name | The prefix name to use in configuration. | string |-|
| environment | The environment name to use in configuration. | string |-|
| additional_tags | Common Tags to be merged with main tags. | map(string) | {} |

## Outputs
| Name | Description |
|-|-|
| ecsTaskExecutionRole_arn | ECS task execution role arn |
| ecsInstanceRole_arn | ECS instance role arn |
| instance_profile_arn | IAM instance profile arn |
| ecsInstanceRolePolicy_id | ECS instance role policy id |
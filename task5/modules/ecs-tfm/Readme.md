# AWS ECS cluster with ECS service and task definition module

This module AWS ECS cluster with ECS service and task definition.

## Variables

| Name | Description | Type | Default value |
|-|-|-|-|
| prefix_name | The prefix name to use in configuration. | string |-|
| environment | The environment name to use in configuration. | string| test |
| create_ecs | Create ECS or not? | bool | true |
| launch_type | The ECS service launch type. | string | EC2 |
| min_count | Number of instances of the task definition to place and keep running. | number | 1 |
| additional_tags | Common Tags to be merged with main tags. | map(string) | {} |
| ecs_task_execution_role| ECS task execution role ARN.| string |-|
## Outputs

| Name | Description |
|-|-|
| cluster_name | The output of cluster name. |
| service_arn | The ECS Service ARN. |
| task_def_arn | The Task Definition ARN. |
# ASG and ECS Terraform module

## Agenda
Need to create a module for ASG (includes asg and launch configuration)
Need to create a module for ECS specific resources (ECS service, ECS cluster, ECS task definition)
Add user data into ASG module to include EC2 instances into ECS cluster.
Deploy centos container (https://hub.docker.com/_/centos) to ECS using your modules.

## Variables

| Name | Description | Type | Default value |
|-|-|-|-|
| aws_region | The AWS Region to use for | string  | us-east-1 |
| os_platform_owner | The platform owner to use in image search | string | amazon |
| os_platform_name | The image pattern to use in filter search | string  | amzn2-ami-kernel-5.10-hvm*-x86_64-gp2 |
| prefix_name | The prefix name to use in configuration | string |-|
| environment | The environment name to use in configuration | string | test |
| instance_type | The EC2 instance type to use | string | t2.micro |
| pub_key_name | The public KeyPair name | string |-|
| root_vol_size | The root block device size in Gb | number | 30 |
| root_vol_type | The root block device type | string | gp3 |
| asg_max_size | The maximum size of the Auto Scaling Group | number | 2 |
| asg_min_size | The minimum size of the Auto Scaling Group | number | 1 |
| vpc_id | A VPC ID | string |-|
| ami_owner | List of AMI owners to limit search. At least 1 value must be specified | string | amazon |
| image_id | The ECS optimized EC2 image ID to launch | string |-|
| default_user_data_template_file | Default user-data file | string | default_user-data.sh |
| user_data | Main user-data | string |-|
| additional_tags | Common Tags to be merged with main tags | map(string) | {} |
| launch_config_name | The Launch Configuration name | string | lcfg |
| asg_name | The Auto-Scaling Group name | string | asg |

## Outputs

| Name | Description |
|-|-|
| ecs_ami_id | The ECS optimized EC2 image ID. |
| ecs_cluster_name | The ECS cluster name. |
| ecs_service_arn | The ECS Service ARN. |
| task_def_arn | The Task Definition ARN. |
| ecs_instance_role_arn | The ECS Instance role ARN. |
| asg_id | The Auto-Scaling Group ID. |
| launch_config_name | The Launch Configuration name. |

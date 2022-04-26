# AWS ECS cluster with ECS service and task definition module

This module AWS ECS cluster with ECS service and task definition.

## Variables

| Name | Description | Type | Default value |
|-|-|-|-|
| prefix_name | The prefix name to use in configuration. | string |-|
| environment | The environment name to use in configuration. | string| test |
| cluster_name | Name of the cluster (up to 255 letters, numbers, hyphens, and underscores) | string |-|
| create_ecs | Create ECS or not? | bool | true |
| ecsInstanceRoleAssumeRolePolicy | The ECS Instance AssumeRole policy. | string | <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
} |
| ecsInstancerolePolicy | The ECS Instance Role Policy. | string | <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecs:CreateCluster",
        "ecs:DeregisterContainerInstance",
        "ecs:DiscoverPollEndpoint",
        "ecs:Poll",
        "ecs:RegisterContainerInstance",
        "ecs:StartTelemetrySession",
        "ecs:Submit*",
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
} |
| service_name | The ECS service name. | string |-|
| unique_name | The ECS task definition unique name. | string |-|
| launch_type | The ECS service launch type. | string | EC2 |
| min_count | Number of instances of the task definition to place and keep running. | number | 1 |
| additional_tags | Common Tags to be merged with main tags. | map(string) | {} |

## Outputs

| Name | Description |
|-|-|
| cluster_name | The output of cluster name. |
| ecsInstanceRole_arn | The ecsInstanceRole arn. |
| ecsInstanceRolePolicy_id | The ecsInstanceRolePolicy arn. |
| iam_instance_profile_name | IAM instance profile. |
| service_id | The ECS Service ID. |
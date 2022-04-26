variable "prefix_name" {
  description = "The prefix name to use in configuration."
  type        = string
  default     = ""
}
variable "environment" {
  description = "The environment name to use in configuration."
  type        = string
  default     = "test"
}
variable "cluster_name" {
  description = "Name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
  default     = ""
}
variable "create_ecs" {
  description = "Create ECS or not?"
  type        = bool
  default     = true
}
variable "ecsInstanceRoleAssumeRolePolicy" {
  description = "The ECS Instance AssumeRole policy."
  type        = string
  default     = <<EOF
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
}
EOF
}
variable "ecsInstancerolePolicy" {
  description = "The ECS Instance Role Policy."
  type        = string
  default     = <<EOF
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
}
EOF
}
variable "service_name" {
  description = "The ECS service name."
  type        = string
  default     = ""
}
variable "unique_name" {
  description = "The ECS task definition unique name."
  type        = string
  default     = ""
}
variable "launch_type" {
  description = "The ECS service launch type."
  type        = string
  default     = "EC2"
}
variable "min_count" {
  description = "Number of instances of the task definition to place and keep running."
  type        = number
  default     = 1
}
variable "additional_tags" {
  description = "Common Tags to be merged with main tags."
  type        = map(string)
  default     = {}
}
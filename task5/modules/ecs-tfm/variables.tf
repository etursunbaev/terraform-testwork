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
    type = string
    default = ""
}
variable "ecsInstanceRoleAssumeRolePolicy" {
  type = string

  default = <<EOF
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
  type = string

  default = <<EOF
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
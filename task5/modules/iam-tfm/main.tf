locals {
  extra_tags = merge(var.additional_tags, {
    Environment = var.environment
    },
  )
}
data "aws_iam_policy" "this_managed" {
  name = "AmazonECSTaskExecutionRolePolicy"
}
resource "aws_iam_role" "this_ecsTaskExecutionRole" {
  name                = "${var.prefix_name}-${var.environment}-ecsTaskExecutionRole"
  assume_role_policy  = file("policies/eccTaskExecutionAssumeRolePolicy.json")
  managed_policy_arns = [data.aws_iam_policy.this_managed.arn]
}
resource "aws_iam_role" "this_ecsInstanceRole" {
  name               = "${var.prefix_name}-${var.environment}-ecsInstanceRole"
  assume_role_policy = file("policies/ecsInstanceRoleAssumeRolePolicy.json")
  tags               = local.extra_tags
}
resource "aws_iam_role_policy" "this_ecsInstanceRolePolicy" {
  name   = "${var.prefix_name}-${var.environment}-ecsInstanceRolePolicy"
  role   = aws_iam_role.this_ecsInstanceRole.id
  policy = file("policies/ecsInstancerolePolicy.json")
}
resource "aws_iam_instance_profile" "this_profile" {
  name = "${var.prefix_name}-${var.environment}-iam-instance-profile"
  role = aws_iam_role.this_ecsInstanceRole.name
  tags = local.extra_tags
}
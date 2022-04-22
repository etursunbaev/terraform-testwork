resource "aws_ecs_cluster" "cluster" {
    name = var.cluster_name != "" && var.create_ecs ? var.cluster_name : "example"
}
resource "aws_iam_role" "ecsInstanceRole" {
  name               = "${var.prefix_name}-${var.environment}-ecsInstanceRole" : 
  assume_role_policy = var.ecsInstanceRoleAssumeRolePolicy
}
resource "aws_iam_role_policy" "ecsInstanceRolePolicy" {
  name   = "${var.prefix_name}-${var.environment}-ecsInstanceRolePolicy"
  role   = aws_iam_role.ecsInstanceRole.id
  policy = var.ecsInstancerolePolicy
}

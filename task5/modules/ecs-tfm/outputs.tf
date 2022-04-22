output "cluster_name" {
  description = "The output of cluster name."
  value       = aws_ecs_cluster.cluster.name
}
output "ecsInstanceRole_arn" {
  description = "The ecsInstanceRole arn."
  value = aws_iam_role.ecsInstanceRole.arn
}
output "ecsInstanceRolePolicy_id" {
  description = "The ecsInstanceRolePolicy arn."
  value = aws_iam_role_policy.ecsInstanceRolePolicy.id
}
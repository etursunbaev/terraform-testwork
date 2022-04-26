output "cluster_name" {
  description = "The output of cluster name."
  value       = aws_ecs_cluster.this_cluster.name
}
output "ecsInstanceRole_arn" {
  description = "The ecsInstanceRole arn."
  value       = aws_iam_role.ecsInstanceRole.arn
}
output "ecsInstanceRolePolicy_id" {
  description = "The ecsInstanceRolePolicy arn."
  value       = aws_iam_role_policy.ecsInstanceRolePolicy.id
}
output "iam_instance_profile_name" {
  description = "IAM instance profile."
  value       = aws_iam_instance_profile.this_profile.name
}
output "service_id" {
  description = "The ECS Service ID."
  value       = aws_ecs_service.this_service.id
}
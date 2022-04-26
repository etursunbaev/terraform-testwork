output "cluster_name" {
  description = "The output of cluster name."
  value       = aws_ecs_cluster.this_cluster.name
}
output "ecsInstanceRole_arn" {
  description = "The ecsInstanceRole ARN."
  value       = aws_iam_role.ecsInstanceRole.arn
}
output "ecsInstanceRolePolicy_id" {
  description = "The ecsInstanceRolePolicy ARN."
  value       = aws_iam_role_policy.ecsInstanceRolePolicy.id
}
output "iam_instance_profile_name" {
  description = "IAM instance profile name."
  value       = aws_iam_instance_profile.this_profile.name
}
output "service_arn" {
  description = "The ECS Service ARN."
  value       = aws_ecs_service.this_service.id
}
output "task_def_arn" {
  description = "The Task Definition ARN."
  value       = aws_ecs_task_definition.this_task.arn
}
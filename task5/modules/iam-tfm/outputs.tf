output "ecsTaskExecutionRole_arn" {
  description = "ECS task execution role arn"
  value       = aws_iam_role.this_ecsTaskExecutionRole.arn
}
output "ecsInstanceRole_arn" {
  description = "ECS instance role arn"
  value       = aws_iam_role.this_ecsInstanceRole.arn
}
output "instance_profile_arn" {
  description = "IAM instance profile arn"
  value       = aws_iam_instance_profile.this_profile.arn
}
output "ecsInstanceRolePolicy_id" {
  description = "ECS instance role policy id"
  value       = aws_iam_role_policy.this_ecsInstanceRolePolicy.id
}
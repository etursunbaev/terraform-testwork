output "cluster_name" {
  description = "The output of cluster name."
  value       = aws_ecs_cluster.this_cluster.name
}
output "service_arn" {
  description = "The ECS Service ARN."
  value       = aws_ecs_service.this_service.id
}
output "task_def_arn" {
  description = "The Task Definition ARN."
  value       = aws_ecs_task_definition.this_task.arn
}
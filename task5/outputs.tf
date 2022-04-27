output "ecs_ami_id" {
  description = "The ECS optimized EC2 image ID."
  value       = data.aws_ami.ecs_ami.image_id
}
output "ecs_cluster_name" {
  description = "The ECS cluster name."
  value       = module.md-ecs.cluster_name
}
output "ecs_service_arn" {
  description = "The ECS Service ARN."
  value       = module.md-ecs.service_arn
}
output "task_def_arn" {
  description = "The Task Definition ARN."
  value       = module.md-ecs.task_def_arn
}
output "ecs_instance_role_arn" {
  description = "The ECS Instance role ARN."
  value       = module.md-ecs.ecsInstanceRole_arn
}
output "asg_id" {
  description = "The Auto-Scaling Group ID."
  value       = module.md-asg.asg_id
}
output "launch_config_name" {
  description = "The Launch Configuration name."
  value       = module.md-asg.launch_configuration_name
}

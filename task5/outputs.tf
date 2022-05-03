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
output "asg_id" {
  description = "The Auto-Scaling Group ID."
  value       = module.md-asg.asg_id
}
output "launch_config_name" {
  description = "The Launch Configuration name."
  value       = module.md-asg.launch_configuration_name
}
output "sg_id" {
  description = "The Security Group ID."
  value = module.md-sg.sg_id
}
output "ecs_task_execution_role_arn" {
  description = "ECS task execution role ARN."
  value = module.md-iam.ecsTaskExecutionRole_arn
}
output "ecs_instance_role_arn" {
  description = "ECS instance role ARN."
  value = module.md-iam.ecsInstanceRole_arn
}
output "public_ip" {
  description = "EC2 Instances public IP"
  value       = data.aws_instances.this_instance.public_ips
}

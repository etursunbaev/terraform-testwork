output "asg_id" {
  description = "ASG ID"
  value       = aws_autoscaling_group.AiAl.id
}
output "launch_configuration_name" {
  description = "The Launch Configuration name."
  value       = aws_launch_configuration.asg_launch_conf.name
}
output "asg_id" {
  description = "Auto-Scaling Group ID."
  value       = aws_autoscaling_group.this_asg.id
}
output "asg_name" {
  description = "Auto-Scaling Group name."
  value       = aws_autoscaling_group.this_asg.name
}
output "launch_configuration_name" {
  description = "The Launch Configuration name."
  value       = aws_launch_configuration.this_launch_conf.name
}
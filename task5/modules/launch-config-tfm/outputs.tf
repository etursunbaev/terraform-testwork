output "launch_configuration_name" {
  description = "The Launch Configuration name."
  value = aws_launch_configuration.asg_launch_conf.name
}
resource "aws_autoscaling_group" "AiAl" {
  name                 = "${var.prefix_name}-${var.environment}-asg"
  max_size             = var.asg_max_size
  min_size             = var.asg_min_size
  launch_configuration = var.launch_config_name
  vpc_zone_identifier  = var.subnets
}
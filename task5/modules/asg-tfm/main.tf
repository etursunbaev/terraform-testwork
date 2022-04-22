resource "aws_autoscaling_group" "AiAl" {
  name                 = "${var.prefix_name}-${var.environment}-asg"
  max_size             = var.asg_max_size
  min_size             = var.asg_min_size
  launch_configuration = aws_launch_configuration.asg_launch_conf.name
  vpc_zone_identifier  = var.subnets
}
resource "aws_launch_configuration" "asg_launch_conf" {
  name          = "${var.prefix_name}-${var.environment}-lcfg"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.pub_key_name
  #   security_groups = var.security_groups
  user_data = var.user_data_template_file 
  root_block_device {
    volume_size = var.root_vol_size
    volume_type = var.root_vol_type
  }
  lifecycle {
    create_before_destroy = true
  }
}
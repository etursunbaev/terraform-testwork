resource "aws_launch_configuration" "this_launch_conf" {
  name                 = var.launch_config_name
  image_id             = var.image_id
  instance_type        = var.instance_type
  iam_instance_profile = var.instance_profile
  key_name             = var.pub_key_name
  user_data            = var.user_data_template_file
  root_block_device {
    volume_size = var.root_vol_size
    volume_type = var.root_vol_type
  }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_group" "this_asg" {
  name                 = var.asg_name
  max_size             = var.asg_max_size
  min_size             = var.asg_min_size
  launch_configuration = aws_launch_configuration.this_launch_conf.name
  vpc_zone_identifier  = var.subnets
  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = false
  }
}

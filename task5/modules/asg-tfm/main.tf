locals {
  name_end = substr(md5("${var.prefix_name}-${var.environment}-${var.image_id}"), 0, 9)
  extra_tags = [
    {
      key                 = "Environment"
      value               = var.environment
      propagate_at_launch = true
    },
    {
      key                 = "Departament"
      value               = can(var.additional_tags.Departament) ? lookup(var.additional_tags, "Departament") : null
      propagate_at_launch = can(var.additional_tags.Departament)
    },
    {
      key                 = "ManagedBy"
      value               = can(var.additional_tags.ManagedBy) ? lookup(var.additional_tags, "ManagedBy") : null
      propagate_at_launch = can(var.additional_tags.ManagedBy)
    },
    {
      key                 = "Platform"
      value               = can(var.additional_tags.Platform) ? lookup(var.additional_tags, "Platform") : null
      propagate_at_launch = can(var.additional_tags.Platform)
    },
    {
      key                 = "Name"
      value               = "${var.prefix_name}-${var.environment}-asg-${local.name_end}"
      propagate_at_launch = true
    }
  ]
}
resource "aws_launch_configuration" "this_launch_conf" {
  name_prefix          = "${var.prefix_name}-${var.environment}"
  image_id             = var.image_id != "" ? var.image_id : var.default_image_id
  instance_type        = var.instance_type
  iam_instance_profile = var.instance_profile
  key_name             = var.pub_key_name
  user_data            = var.user_data_template_file
  security_groups      = var.security_groups
  root_block_device {
    volume_size = var.root_vol_size
    volume_type = var.root_vol_type
  }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_group" "this_asg" {
  name_prefix          = "${var.prefix_name}-${var.environment}"
  max_size             = var.asg_max_size
  min_size             = var.asg_min_size
  launch_configuration = aws_launch_configuration.this_launch_conf.name
  vpc_zone_identifier  = var.subnets
  tags                 = local.extra_tags
}

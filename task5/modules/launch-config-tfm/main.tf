data "aws_ami" "image" {
  owners      = [var.os_platform_owner]
  most_recent = true


  filter {
    name   = "name"
    values = [var.os_platform_name]
  }
}

resource "aws_launch_configuration" "asg_launch_conf" {
  name   = "${var.prefix_name}-${var.environment}-lcfg"
  image_id      = data.aws_ami.image.id
  instance_type = var.instance_type
  key_name = var.pub_key_name
#   security_groups = var.security_groups
#   user_data = 
  root_block_device {
    volume_size = var.root_vol_size
    volume_type = var.root_vol_type
  }
  lifecycle {
    create_before_destroy = true
  }
}

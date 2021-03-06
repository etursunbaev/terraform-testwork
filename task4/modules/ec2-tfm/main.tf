data "aws_caller_identity" "current" {}
# Resources

##########################################################################################
# THIS tls_private_key resource module IS NOT RECOMMENDED FOR PRODUCTION SERVICES.                   #
# Read more about here https://registry.terraform.io/providers/hashicorp/tls/latest/docs #
##########################################################################################
resource "tls_private_key" "rsa_gen_key" {
  algorithm = var.tls_algorithm
  rsa_bits  = var.tls_bits
}

resource "aws_key_pair" "rsa_pub_key" {
  key_name   = var.pub_key_name
  public_key = tls_private_key.rsa_gen_key.public_key_openssh
  tags = merge(var.additional_tags, {
    Environment = var.environment
    },
  )
}
resource "local_file" "save_priv_key_pem" {
  filename        = "${path.module}/${var.pub_key_name}.pem"
  content         = tls_private_key.rsa_gen_key.private_key_pem
  file_permission = "0600"
}
resource "aws_instance" "basic_instance" {
  count                  = var.instance_count > 0 ? var.instance_count : 0
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.rsa_pub_key.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  metadata_options {
    instance_metadata_tags = "enabled"
    http_endpoint          = "enabled"
  }
  root_block_device {
    volume_size = var.root_block_device_size
    volume_type = var.root_block_device_type
  }
  tags = merge(var.additional_tags, {
    Name            = format("${var.prefix_name}-${var.instance_name}-%03d", count.index + 1)
    Date_creation   = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    Your_First_Name = var.your_first_name
    Your_Last_Name  = var.your_last_name
    AWS_Account_ID  = data.aws_caller_identity.current.account_id
    Environment     = var.environment
    }
  )
  user_data = var.user_data_template_file
}
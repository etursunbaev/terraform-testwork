data "aws_caller_identity" "current" {}
data "aws_ami" "os_platform" {
  owners = [var.os_platform_owner]
  most_recent = true

  filter {
    name = "name"
    values = [var.os_platform_name]
  }
}
resource "aws_instance" "my_Instance" {
  count = (var.items_count == "" ? var.items_count : 1 )
  ami = data.aws_ami.os_platform.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  availability_zone = var.availability_zone
  vpc_security_group_ids = var.vpc_security_group_ids
  metadata_options {
      instance_metadata_tags = "enabled"
      http_endpoint = "enabled"
  }
  tags = {
      Name = var.instance_name
      Date_creation = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
      OS_type = data.aws_ami.os_platform.platform_details
      Your_First_Name = var.your_first_name
      Your_Last_Name = var.your_last_name
      AWS_Account_ID = data.aws_caller_identity.current.account_id
  }
  user_data = file("${path.module}/init.tftpl")
  provisioner "file" {
    source = "${path.module}/samplefile.txt"
    destination = "/home/${var.instance_user}/samplefile.txt"
    connection {
      type = "ssh"
      user = var.instance_user
      private_key =  file("~/.ssh/id_rsa")
      host = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "cat ~/samplefile.txt"
    ]
    connection {
      type = "ssh"
      user = var.instance_user
      private_key =  file("~/.ssh/id_rsa")
      host = self.public_ip
    }
  }
}
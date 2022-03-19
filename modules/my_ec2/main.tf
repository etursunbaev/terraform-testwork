data "aws_caller_identity" "current" {}
data "aws_ami" "os_platform" {
  owners           = ["amazon"]

  filter {
    name   = "image-id"
    values = [var.ami_id]
  }
}

resource "aws_instance" "my_Instance" {
    ami = var.ami_id
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
        Your_First_Name = var.FirstName
        Your_Last_Name = var.LastName
        AWS_Account_ID = data.aws_caller_identity.current.account_id
    }
    user_data = file("init.sh")
}
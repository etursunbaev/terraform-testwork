resource "aws_instance" "my_Instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    availability_zone = var.availability_zone
    vpc_security_group_ids = var.vpc_security_group_ids
    tags = {
        Name = var.instance_name
        # Date_creation = 
        # OS_type =
        # Your_First_Name = 
        # Your_Last_Name = 
        # AWS_Account_ID =
    }
    user_data = <<EOF
        #!/bin/bash
        # get admin privileges
        sudo su

        # install httpd (Linux 2 version)
        yum update -y
        yum install -y httpd.x86_64
        systemctl start httpd.service
        systemctl enable httpd.service
        echo "Hello World from $(hostname -f)" > /var/www/html/index.html
    EOF
}
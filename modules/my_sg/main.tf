#variable "my_ip" {}
resource "aws_security_group" "allow_ssh" {
    name = "Allow SSH"
    description = "Allow inbound SSH from my home IP address"

    ingress {
        description      = "SSH from my home IP"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = [var.my_ip]
    }
}
resource "aws_security_group" "allow_http" {
    name = "Allow HTTP"
    description = "Allow inbound HTTP access from my home IP address"

    ingress {
        description      = "HTTP from home IP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = [var.my_ip]
    }
}
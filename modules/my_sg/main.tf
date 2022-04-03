data "http" "my_ip" {
  url = "http://ifconfig.io/ip"
}
resource "aws_security_group" "allow_ssh" {
    name = "Allow SSH"
    description = "Allow inbound SSH from my home IP address"

    ingress {
        description      = "SSH from my home IP"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["${chomp(data.http.my_ip.body)}/32"]
    }
}
resource "aws_security_group" "allow_web" {
    name = "Allow HTTP"
    description = "Allow inbound HTTP access from my home IP address"

    ingress {
        description      = "HTTP from home IP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["${chomp(data.http.my_ip.body)}/32"]
    }
}
resource "aws_security_group" "allow_out_all" {
    name = "Allow all Out"
    description = "Allow outbound HTTP access from my instance"

    egress {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "Open internet"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
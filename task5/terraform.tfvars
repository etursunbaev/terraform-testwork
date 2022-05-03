aws_region  = "us-east-1"
prefix_name = "my"
environment = "lab"
public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAWh0B3D1b1fhLwq+15Y67XcHBhOMmaeSbX6njV98fd+z/NlSjvMgN9pwOWaMfa9lQ5hOOt7k7hok2VowV9d8X8S9OQPDFVs3JlPZYsCmm683eO/U9WsOPwZTuUVOwJskHqK0HRmS4GfaanubvMGbjFH8zPd13W0pbqqVYx2pNAgxkvjdwFpNWNJjR/n4bxS3rdCAYzXl8OuqbDdG0FeitzCNld+24S1g80bRfK0EJC+MrvoZ9hU0VJjWtQq2pPxpzBk07JUzSRDs0GWH8H0/IZiWgEo28XaGOC+5Ji9SBlR300/FWvhwHLk8ffV+jDfq/d4I/HGeb/vzaCJ0MZHSN"
vpc_id      = "vpc-02532678f469d05ca"
additional_tags = {
  "Departament" = "IT"
  "Platform"    = "Container"
  "ManagedBy"   = "Terraform"
}
asg_min_size   = 2
asg_max_size   = 3
create_sg      = true
default_vpc_id = "vpc-02532678f469d05ca"
ingress_rules = [
  {
    "cidr_blocks" = "212.241.20.0/24"
    "description" = "SSH Access from"
    "from_port"   = "22"
    "to_port"     = "22"
    "protocol"    = "tcp"
  }
]
egress_rules = [
  {
    "cidr_blocks" = "0.0.0.0/0"
    "description" = "Open ALL egress"
    "from_port"   = "0"
    "to_port"     = "65535"
    "protocol"    = "all"
  }
]
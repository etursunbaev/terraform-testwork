additional_tags = {
  "departament_name" = "IT"
}
vpc_id         = "vpc-02532678f469d05ca"
create_sg      = true
prefix_name    = "my"
environment    = "test"
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
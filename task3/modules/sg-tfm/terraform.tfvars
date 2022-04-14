additional_tags = {
  "departament_name" = "IT"
}
create_sg = true
sg_count = 1
prefix_name = "my"
environment = "test"
default_vpc_id = "vpc-02532678f469d05ca"
ingress_rules = [ {
    "description" = "SSH Access from"
    "from_port" = "22"
    "to_port" = "22"
    "protocol" = "ssh"
    "cidr_blocks" = "212.241.20.0/24"
},
{
    "description" = "HTTP access"
    "from_port" = "80"
    "to_port" = "80"
    "protocol" = "http"
    "cidr_blocks" = "212.241.20.0/24"
} ]
egress_rules = [
    {
        "cidr_blocks" = "0.0.0.0/0"
        "description" = "Open ALL egress"
        "from_port" = "0"
        "to_port" = "65535"
        "protocol" = "all"
    }
]
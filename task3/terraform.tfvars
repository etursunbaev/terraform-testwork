aws_region = "us-east-1"
create_sg = true
pub_key_name = "MyPublic"
vpc_az = "us-east-1b"
instance_count       = 1
your_first_name   = "Eldar"
your_last_name    = "Tursunbaev"
default_vpc_id = "vpc-02532678f469d05ca"
ingress_rules = [ 
    {
        "description" = "ssh access"
        "from_port" = "22"
        "to_port" = "22"
        "protocol" = "tcp"
        "cidr_blocks" = "212.241.20.0/24"
    },
    {
        "description" = "http access in"
        "from_port" = "80"
        "to_port" = "80"
        "protocol" = "tcp"
        "cidr_blocks" = "212.241.20.0/24"
    } 
]
egress_rules = [
    {
        "cidr_blocks" = "0.0.0.0/0"
        "description" = "Open ALL egress"
        "from_port" = "0"
        "to_port" = "65535"
        "protocol" = "all"
    },
]
additional_tags = {
  "departament" = "IAD"
  "ManagedBy" = "Terraform"
}
root_block_device_size = 10
root_block_device_type = "gp3"
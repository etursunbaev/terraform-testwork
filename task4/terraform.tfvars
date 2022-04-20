aws_region     = "us-east-1"
create_sg      = true
vpc_az         = "us-east-1c"
pub_key_name   = "pubkey"
environment    = "test"
prefix_name    = "my"
default_vpc_id = "vpc-02532678f469d05ca"
ingress_rules = [
  {
    "description" = "ssh access"
    "from_port"   = "22"
    "to_port"     = "22"
    "protocol"    = "tcp"
    "cidr_blocks" = "212.241.20.0/24"
  },
  {
    "description" = "http access in"
    "from_port"   = "80"
    "to_port"     = "80"
    "protocol"    = "tcp"
    "cidr_blocks" = "212.241.20.0/24"
  }
]
egress_rules = [
  {
    "cidr_blocks" = "0.0.0.0/0"
    "description" = "Open ALL egress"
    "from_port"   = "0"
    "to_port"     = "65535"
    "protocol"    = "all"
  },
]
additional_tags = {
  "departament" = "IAD"
  "ManagedBy"   = "Terraform"
}
project = {
  Alpha = {
    instance_type  = "t2.micro"
    instance_count = 1
    first_name     = "John"
    last_name      = "Doe"
    root_vol_size  = 10
    root_vol_type  = "gp3"
    environment    = "dev"
    prefix_name    = ""
    tls_algorithm  = ""
    tls_bits       = null
  },
  Beta = {
    instance_type  = "t2.micro"
    instance_count = 1
    first_name     = "Joanna"
    last_name      = "Dawson"
    root_vol_size  = 8
    root_vol_type  = ""
    environment    = ""
    prefix_name    = ""
    tls_algorithm  = ""
    tls_bits       = null
  }
}

create = true
create_sg = true
pub_key_name = "~/.ssh/id_rsa.pub"
instance_type     = "t2.micro"
vpc_az = "us-east-1c"
instance_name     = "srv"
instance_count       = 1
your_first_name   = "Eldar"
your_last_name    = "Tursunbaev"
os_platform_name  = "amzn2-ami-kernel-5.10-hvm*-x86_64-gp2"
os_platform_owner = "amazon"
data_http_ip_url = "http://ifconfig.io/ip"
path_priv_key = "~/.ssh/id_rsa"
environment       = "test"
departament_name = "IAD"
vpc_id = "vpc-02532678f469d05ca"
prefix_name = "my"
aws_region = "us-east-1"
your_aws_access_key_id = ""
your_aws_secret_access_key = ""
ingress_rules = [ {
    "description" = "test-rule"
    "from_port" = "22"
    "to_port" = "22"
    "protocol" = "tcp"
    "cidr_blocks" = "0.0.0.0/0"
},
{
    "description" = "test-rule2"
    "from_port" = "80"
    "to_port" = "80"
    "protocol" = "tcp"
    "cidr_blocks" = "0.0.0.0/0"
} ]
egress_rules_default = [
    {
        "cidr_blocks" = "0.0.0.0/0"
        "description" = "Open ALL egress"
        "from_port" = "0"
        "to_port" = "65535"
        "protocol" = "all"
    }
]
ingress_rules_default = [ {
    "cidr_blocks" = "172.31.2.0/24"
    "description" = "test-rule-default"
    "from_port" = "3306"
    "to_port" = "3306"
    "protocol" = "tcp"
},
{
    "cidr_blocks" = "172.31.1.0/24"
    "description" = "test-rule-default-2"
    "from_port" = "5132"
    "to_port" = "5132"
    "protocol" = "tcp"
} ]
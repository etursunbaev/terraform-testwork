your_first_name   = "Eldar"
your_last_name    = "Tursunbaev"
environment       = "test"
data_http_ip_url = "http://ifconfig.io/ip"
vpc_id = "vpc-02532678f469d05ca"
prefix_name = "my"
departament_name = "IAD"
ingress_rules = [ {
    "description" = "test-rule"
    "from_port" = "22"
    "to_port" = "22"
    "protocol" = "ssh"
    "cidr_blocks" = "0.0.0.0/0"
},
{
    "description" = "test-rule2"
    "from_port" = "80"
    "to_port" = "80"
    "protocol" = "http"
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
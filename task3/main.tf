provider "aws" {
    access_key = var.your_aws_access_key_id
    secret_key = var.your_aws_secret_access_key
    region = var.aws_region
}
module "md-key" {
    source = "./modules/key-tfm"
    departament_name = var.departament_name
    environment = var.environment
    prefix_name = var.prefix_name
}
module "md-sg" {
    source = "./modules/sg-tfm"
    departament_name = var.departament_name
    environment = var.environment
    create = var.create
    create_sg = var.create_sg
    security_group_id = var.security_group_id
    vpc_id = var.vpc_id
    data_http_ip_url = var.data_http_ip_url
    prefix_name = var.prefix_name
    sg_description = var.sg_description
    revoke_rules_on_delete = var.revoke_rules_on_delete
    ingress_rules = var.ingress_rules
    egress_rules_default = var.egress_rules_default
}
module "md-ec2" {
    source = "./modules/ec2-tfm"
    create = var.create
    pub_key_name = module.md-key.pub_key_name
    instance_type = var.instance_type
    vpc_az = var.vpc_az
    instance_name = var.instance_name
    vpc_security_group_ids = module.md-sg.sg_id
    your_first_name = var.your_first_name
    your_last_name = var.your_last_name
    instance_count = var.instance_count
    os_platform_name  = var.os_platform_name
    os_platform_owner = var.os_platform_owner
    path_priv_key = module.md-key.priv-key-pem
    environment = var.environment
    departament_name = var.departament_name
    vpc_id = var.vpc_id
    prefix_name = var.prefix_name
    aws_region = var.aws_region
}
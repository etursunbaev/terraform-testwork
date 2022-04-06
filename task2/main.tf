provider "aws" {
    access_key = var.your_aws_access_key_id
    secret_key = var.your_aws_secret_access_key
    region = var.aws_region
}

module "my_ec2" {
    source = "../task1"
    your_first_name = var.your_first_name
    your_last_name = var.your_last_name
    environment = var.environment
    items_count = var.items_count
    my_pub_key = var.my_pub_key
    instance_type = var.instance_type
    vpc_az = var.vpc_az
    instance_name = var.instance_name
    os_platform_owner = var.os_platform_owner
    os_platform_name  = var.os_platform_name
    path_priv_key = var.path_priv_key
    data_http_ip_url = var.data_http_ip_url
    vpc_id = var.vpc_id
    prefix_name = var.prefix_name
    departament_name = var.departament_name
    aws_region = var.aws_region
}
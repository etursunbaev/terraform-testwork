provider "aws" {
    shared_config_files      = ["~/.aws/config"]
    shared_credentials_files = ["~/.aws/credentials"]
    region = "us-east-1"
}
module "my_ssh_key" {
    source = "./modules/my_ssh_key"
}
module "my_sg" {
    source = "./modules/my_sg"
    my_ip = var.my_ip
}
module "my_ec2" {
    source = "./modules/my_ec2"
    key_name = module.my_ssh_key.key_name
    vpc_security_group_ids = [module.my_sg.ssh_sg_id,module.my_sg.web_sg_id,module.my_sg.out_sg_id]    
}
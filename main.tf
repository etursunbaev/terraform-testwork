provider "aws" {
  #required_version = "0.13"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  region = "us-east-1"
}
module "my_ssh_key" {
  source = "./modules/my_ssh_key"
}
module "my_sg" {
  source = "./modules/my_sg"
}
module "my_ec2" {
  source = "./modules/my_ec2"
  key_name = module.my_ssh_key.key_name
  vpc_security_group_ids = [module.my_sg.ssh_sg_id,module.my_sg.web_sg_id,module.my_sg.out_sg_id]    
}
output "PublicIP" {
  value = module.my_ec2.Instance_Public_IP
}
output "ami_id" {
  value = module.my_ec2.AMIID
}
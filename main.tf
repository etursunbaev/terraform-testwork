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

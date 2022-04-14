provider "aws" {
    access_key = var.your_aws_access_key_id
    secret_key = var.your_aws_secret_access_key
    region = var.aws_region
}
data "aws_vpc" "vpc" {
    id = var.vpc_id
}
data "aws_subnet" "subnet" {
    filter {
        name   = "vpc-id"
        values = [var.vpc_id]
    }
    filter {
        name = "availability-zone"
        values = [var.vpc_az]
    }
}
module "md-sg" {
    source = "./modules/sg-tfm"
    environment = var.environment
    create_sg = var.create_sg
    vpc_id = data.aws_vpc.vpc.id
    prefix_name = var.prefix_name
    # ingress_rules = var.ingress_rules
    # egress_rules = var.egress_rules
}
module "md-ec2" {
    source = "./modules/ec2-tfm"
    #pub_key_name = var.pub_key_name
    instance_count = var.instance_count
    subnet_id = data.aws_subnet.subnet.id
    vpc_security_group_ids = module.md-sg.sg_id
    tls_algorithm = "RSA"
    prefix_name = var.prefix_name
}
data "template_file" "check_user-data" {
    template = "${file("${path.module}/${var.check_user_data_template_file}")}"
}
data "template_file" "print_cmd" {
    template = "${file("${path.module}/print.sh")}"
}
# resource "local_file" "save_priv_key_pem" { 
#     filename = "${path.module}/cloudtls.pem"
#     content = module.md-ec2.priv-key-pem 
#     #tls_private_key.rsa_gen_key.private_key_pem
# }
# resource "null_resource" "remote_print" {
#     count = var.create ? var.instance_count : 0
#     connection {
#         type = "ssh"
#         user = var.instance_user
#         private_key = module.md-ec2.priv-key-pem
#         host = module.md-ec2.instance_public_ip[count.index]
#     }
#     provisioner "remote-exec" {
#         inline = [data.template_file.check_user-data.rendered]
    
#     }
#     provisioner "remote-exec" {
#         inline = ["cat /tmp/success.txt"]
#     }
# }
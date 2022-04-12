locals {
    common_tags = {
        Department = var.departament_name
        ManagedByTerraform = "True"
        Environment = var.environment
    }
}
# THIS IS NOT RECOMMENDED FOR PRODUCTION SERVICES. https://registry.terraform.io/providers/hashicorp/tls/latest/docs
resource "tls_private_key" "rsa_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "aws_key_pair" "pub_key" {
    key_name   = "${var.prefix_name}-${var.environment}-key"
    public_key = tls_private_key.rsa_key.public_key_openssh
    tags = merge(local.common_tags,{
        Name = "${var.prefix_name}-${var.environment}-key"
        },
    )
}
resource "local_file" "cloud_pem" { 
  filename = "${path.module}/cloudtls.pem"
  content = tls_private_key.rsa_key.private_key_pem
}
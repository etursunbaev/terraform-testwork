output "instance_public_ip" {
    description = "EC2 Instance Public IP address."
    value = aws_instance.basic_instance[*].public_ip
}
output "instance_private_ip" {
    description = "EC2 Instance Private IP address."
    value = aws_instance.basic_instance[*].private_ip
}
output "root_block_name" {
    description = "The volume name of the root block device."
    value = aws_instance.basic_instance[*].root_block_device.*.device_name
}
output "root_block_id" {
    description = "The volume ID of the root block device."
    value = aws_instance.basic_instance[*].root_block_device.*.volume_id
}
output "priv-key-pem" {
    description = "The Private key data in PEM (insecured)."
    value = tls_private_key.rsa_gen_key.private_key_pem
    sensitive = true
}
output "pub-key-openssh" {
    description = "Public key data in Authourized files format."
    value = tls_private_key.rsa_gen_key.public_key_openssh
}

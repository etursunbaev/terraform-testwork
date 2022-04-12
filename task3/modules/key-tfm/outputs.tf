output "pub-key-pem" {
    description = "The public key"
    value = tls_private_key.rsa_key.public_key_pem
}
output "priv-key-pem" {
    description = "The Private key (insecured)"
    value = tls_private_key.rsa_key.private_key_pem
    sensitive = true
}
output "pub-key-openssh" {
    description = "OpenSSH public key"
    value = tls_private_key.rsa_key.public_key_openssh
}
output "pub_key_name" {
    description = "Public Key Name"
    value = aws_key_pair.pub_key.key_name
}
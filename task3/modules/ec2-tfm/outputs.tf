output "my_instance_public_ip" {
    description = "Your EC2 Instance Public IP address."
    value = aws_instance.server[*].public_ip
}
output "my_instance_private_ip" {
    description = "Your EC2 Instance Private IP address."
    value = aws_instance.server[*].private_ip
}
output "my_instance_id" {
    description = "Your EC2 Instance ID."
    value = aws_instance.server[*].id
}
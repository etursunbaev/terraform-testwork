output "my_sg_id" {
    description = "Your security group id."
    value = aws_security_group.my_sg.id
}
output "my_instance_public_ip" {
    description = "Your EC2 Instance Public IP address."
    value = aws_instance.my_Instance[*].public_ip
}
output "my_instance_private_ip" {
    description = "Your EC2 Instance Private IP address."
    value = aws_instance.my_Instance[*].private_ip
}
output "my_instance_id" {
    description = "Your EC2 Instance ID."
    value = aws_instance.my_Instance[*].id
}
output "my_sg_id" {
    description = "Your security group id."
    value = module.md-sg.*.sg_id
}
output "my_instance_public_ip" {
    description = "Your EC2 Instance Public IP address."
    value = module.md-ec2.*.my_instance_public_ip
}
output "my_instance_private_ip" {
    description = "Your EC2 Instance Private IP address."
    value = module.md-ec2.*.my_instance_private_ip
}
output "my_instance_id" {
    description = "Your EC2 Instance ID."
    value = module.md-ec2.*.my_instance_id
}
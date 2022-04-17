output "SG-ID" {
    description = "Security Group ID."
    value = module.md-sg.sg_id
}
output "SGRule-ID" {
    description = "Security Group rules IDs."
    value = module.md-sg.sgrule_id
}
output "Instance_Public_IP" {
    description = "EC2 Instances Public IP address."
    value = module.md-ec2.*.instance_public_ip
}
output "Instance_Private_IP" {
    description = "EC2 Instances Private IP address."
    value = module.md-ec2.*.instance_private_ip
}
output "Null_Resource_ID" {
    description = "Null Resource ID only."
    value = null_resource.remote_print.*.id
}
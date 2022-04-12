output "sg_id" {
    description = "Security Groups IDs"
    value = aws_security_group.this_sg[*].id
}
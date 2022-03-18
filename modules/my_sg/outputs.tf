output "ssh_sg_id" {
  value = aws_security_group.allow_ssh.id
}
output "web_sg_id" {
  value = aws_security_group.allow_web.id
}
output "out_sg_id" {
  value = aws_security_group.allow_out_all.id
}
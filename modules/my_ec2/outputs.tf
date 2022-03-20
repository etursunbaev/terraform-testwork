output "Instance_Public_IP" {
  value = aws_instance.my_Instance.public_ip
}
output "AMIID" {
  value = data.aws_ami.os_platform.image_id
}
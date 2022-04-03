output "Instance_Public_IP" {
  value = aws_instance.my_Instance.*.public_ip
}
output "Instance_Private_IP" {
  value = aws_instance.my_Instance.*.private_ip
}
output "Instance_ID" {
  value = aws_instance.my_Instance.*.id
}
resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = file("${var.my_pub_key}")
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAWh0B3D1b1fhLwq+15Y67XcHBhOMmaeSbX6njV98fd+z/NlSjvMgN9pwOWaMfa9lQ5hOOt7k7hok2VowV9d8X8S9OQPDFVs3JlPZYsCmm683eO/U9WsOPwZTuUVOwJskHqK0HRmS4GfaanubvMGbjFH8zPd13W0pbqqVYx2pNAgxkvjdwFpNWNJjR/n4bxS3rdCAYzXl8OuqbDdG0FeitzCNld+24S1g80bRfK0EJC+MrvoZ9hU0VJjWtQq2pPxpzBk07JUzSRDs0GWH8H0/IZiWgEo28XaGOC+5Ji9SBlR300/FWvhwHLk8ffV+jDfq/d4I/HGeb/vzaCJ0MZHSN eldar_tursunbaev@EPKZALMW0245"
}
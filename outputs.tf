output "virtual_machiness" {
  value = [
    for i, instance in module.my_ec2 : {
      InstanceID   = instance.Instance_ID

      private_ip_address = module.my_ec2[i].Instance_Private_IP
      public_ip_address = module.my_ec2[i].Instance_Public_IP
    }
  ]
}
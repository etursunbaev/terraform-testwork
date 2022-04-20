#!/bin/bash
sudo su

# install httpd (Linux 2 version)
yum update -y
amazon-linux-extras install nginx1 -y
echo "SUCCESS!" > /tmp/success.txt
touch /var/tmp/finished-user-data
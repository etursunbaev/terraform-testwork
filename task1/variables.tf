variable "my_pub_key" {
    description = "Path to your public key."
    type = string
    default = ""
}
variable "instance_type" {
    description = "Instance type to be provisioned."
    type = string
    default = "t2.micro"
}
variable "vpc_az" {
    description = "The Availabilty Zone to start the instance in."
    type = string
    default = "us-east-1c"
}
variable "instance_name" {
    description = "Your Instance name."
    type = string
    default = "server"
}
variable "your_first_name" {
    description = "Your first name to be used in environment configuration."
    type = string
    default = ""
}
variable "your_last_name" {
    description = "Your last name to be used in environment configuration."
    type = string
    default = ""
}
variable "items_count" {
    description = "The count of instances to be created. By default one will be created."
    type = number
    default = 1
}
variable "instance_user" {
    description = "The EC2 instance user to be used for ssh in."
    type = map(string)
    default = {
        "amazon" = "ec2-user"
        "ubuntu" = "ubuntu"
    }
}
variable "os_platform_name" {
    description = "The EC2 AMI owner to be used in data filter search."
    type = string
    default = ""
}
variable "os_platform_owner" {
    description = "The EC2 AMI name to be used in data filter search."
    type = string
    default = "amazon"
}
variable "data_http_ip_url" {
    description = "Public resource to retrieve your home network ip."
    type = string
    default = ""
}
variable "path_priv_key" {
    description = "Path to your private ssh key to be used in provision connection."
    type = string
    default = ""
}
variable "environment" {
    description = "The environment name to be used."
    type = string
    default = "dev"
}
variable "departament_name" {
    description = "The departament name."
    type = string
    default = "EPAM"
}
variable "vpc_id" {
    description = "The VPC id to be used in environment."
    type = string
    default = ""
}
variable "prefix_name" {
    description = "The prefix name to be used in namings."
    type = string
    default = ""
}
variable "aws_region" {
    description = "The AWS region to be used in."
    type = string
    default = "us-east-1"
}
variable "your_aws_access_key_id" {
    description = "Your AWS_ACCESS_KEY_ID to be used by terraform."
    type = string
    default = ""
}
variable "your_aws_secret_access_key" {
    description = "Your AWS_SECRET_ACCESS_KEY to be used by terraform."
    type = string
    default = ""
}
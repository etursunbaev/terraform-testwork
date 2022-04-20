variable "create_sg" {
  description = "Weather to create security groups."
  type        = bool
  default     = true
}
variable "additional_tags" {
  description = "Common Tags to be merged with main tags."
  type        = map(string)
  default     = {}
}
variable "sg_description" {
  description = "Description of security group."
  type        = string
  default     = "Security Group managed by Terraform team."
}
variable "ingress_rules" {
  description = "List of ingress rules to create."
  type        = list(map(any))
  default     = []
}
variable "egress_rules" {
  description = "List of egress rules to create."
  type        = list(map(any))
  default     = []
}
variable "vpc_az" {
  description = "The Availabilty Zone to start the instance in."
  type        = string
  default     = "us-east-1c"
}
variable "instance_user" {
  description = "The EC2 instance user to be used for ssh in."
  type        = map(string)
  default = {
    "amazon" = "ec2-user"
    "ubuntu" = "ubuntu"
  }
}
variable "os_platform_name" {
  description = "The EC2 AMI owner to be used in data filter search."
  type        = string
  default     = "amzn2-ami-kernel-5.10-hvm*-x86_64-gp2"
}
variable "os_platform_owner" {
  description = "The EC2 AMI name to be used in data filter search."
  type        = string
  default     = "amazon"
}
variable "environment" {
  description = "The environment name to be used."
  type        = string
  default     = "test"
}
variable "vpc_id" {
  description = "The VPC id to be used in environment."
  type        = string
  default     = ""
}
variable "default_vpc_id" {
  description = "Default VPC id if other is not set."
  type        = string
  default     = ""
}
variable "prefix_name" {
  description = "The prefix name to be used in namings."
  type        = string
  default     = "my"
}
variable "check_user_data_template_file" {
  description = "Check User-Data template file."
  type        = string
  default     = "check.sh"
}
variable "print_cmd_template_file" {
  description = "The print to stdout template bash file"
  type        = string
  default     = "print.sh"
}
variable "user_data_template_file" {
  description = "User-Data template file."
  type        = string
  default     = "root-init.sh"
}
variable "tls_algorithm" {
  description = "TLS Private Key algorithm type."
  type        = string
  default     = "RSA"
}
variable "tls_bits" {
  description = "TLS Bits."
  type        = number
  default     = 4096
}
variable "project" {
  description = "Map of project names to configuration."
  type        = map(any)
  default     = {}
}
variable "pub_key_name" {
  description = "The Public KeyPair name."
  type        = string
  default     = ""
}
variable "aws_region" {
  description = "The AWS region to use in."
  type        = string
  default     = "us-east-1"
}
variable "root_block_device_size" {
  description = "The Root Block Device volume size to create."
  type        = number
  default     = 8
}
variable "root_block_device_type" {
  description = "The Root Block Device volume type to create."
  type        = string
  default     = "gp2"
}
variable "instance_type" {
  description = "The default instance type to be used in."
  type        = string
  default     = "t2.micro"
}
variable "your_first_name" {
  description = "Your first name to be used in environment configuration."
  type        = string
  default     = ""
}
variable "your_last_name" {
  description = "Your last name to be used in environment configuration."
  type        = string
  default     = ""
}
variable "instance_count" {
  description = "The count of instances to be created. By default one will be created."
  type        = number
  default     = 1
}
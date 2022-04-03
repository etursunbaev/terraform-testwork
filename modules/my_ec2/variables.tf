variable "instance_type" {
    description = "Instance type to be provisioned"
    type = string
    default = ""
}
variable "vpc_security_group_ids" {
    description = "(Optional) A list of security group IDs to associate with. "
    type        = list
}
variable "availability_zone" {
    description = "(Optional) The Availabilty Zone to start the instance in."
    default     = ""
}
variable "key_name" {
    description = "The key name to use for the instance."
}
variable "instance_name" {
    description = "Your Instance name"
    type = string
    default = ""
}
variable "your_first_name" {
    description = "Your first name to be used in environment configuration"
    type = string
    default = ""
}
variable "your_last_name" {
    description = "Your last name to be used in environment configuration"
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
    type = string
    default = ""
}
variable "os_platform_name" {
    description = "The EC2 AMI owner to be used in data filter search."
    type = string
    default = ""
}
variable "os_platform_owner" {
    description = "The EC2 AMI name to be used in data filter search."
    type = string
    default = ""
}
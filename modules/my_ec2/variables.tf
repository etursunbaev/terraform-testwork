variable "ami_id" {
    type = string
    default = "ami-033b95fb8079dc481"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "vpc_security_group_ids" {
    description = "(Optional) A list of security group IDs to associate with. "
    type        = list
}
variable "availability_zone" {
    description = "(Optional) The AZ to start the instance in."
    default     = "us-east-1a"
}
variable "key_name" {
    description = "The key name to use for the instance. "
}
variable "instance_name" {
    description = "My Instance name"
    default = "MyTestInstance"
    type = string
}
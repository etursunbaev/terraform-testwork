variable "create" {
  description = "Whether to create security group and all rules."
  type        = bool
  default     = true
}
variable "create_sg" {
  description = "Whether to create security group."
  type        = bool
  default     = true
}
variable "sg_name" {
  description = "Name of security group - not required if create_sg is false."
  type        = string
  default     = null
}
variable "sg_description" {
  description = "Description of security group."
  type        = string
  default     = "Security Group managed by Terraform team."
}
variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. Enable for EMR."
  type        = bool
  default     = false
}
variable "ingress_rules" {
  description = "List of ingress rules to create where 'self' is defined"
  type        = list(map(any))
  default     = []
}
variable "egress_rules_default" {
    description = "List of egress rules to be created"
    type = list(map(any))
    default = []
}
variable "ingress_cidr_blocks" {
    description = "CIDR Blocks."
    type = list(string)
    default = []
}
variable "security_group_id" {
  description = "ID of existing security group whose rules we will manage"
  type        = string
  default     = null
}
variable "ingress_rules_default" {
    description = "Default rules"
    type = list(map(any))
    default = []
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
variable "data_http_ip_url" {
    description = "Public resource to retrieve your home network ip."
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
    default = "IT"
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

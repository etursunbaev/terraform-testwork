variable "additional_tags" {
  description = "Common Tags to be merged with resource tags."
  type        = map(string)
  default     = {}
}
variable "create_sg" {
  description = "Whether to create security group."
  type        = bool
  default     = true
}
variable "prefix_name" {
  description = "The prefix name to be used in namings."
  type        = string
  default     = "my"
}
variable "environment" {
  description = "The environment name to be used."
  type        = string
  default     = "test"
}
variable "sg_description" {
  description = "The default Security Group description."
  type        = string
  default     = "Common Security Group"
}
variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. Enable for EMR."
  type        = bool
  default     = false
}
variable "ingress_rules" {
  description = "List of ingress rules to create."
  type        = list(map(any))
  default     = []
}
variable "egress_rules" {
  description = "List of egress rules to be created"
  type        = list(map(any))
  default     = []
}
variable "vpc_id" {
  description = "The VPC id to be used in environment."
  type        = string
  default     = ""
}
variable "default_vpc_id" {
  description = "The default VPC id if other is not set."
  type        = string
  default     = ""
}
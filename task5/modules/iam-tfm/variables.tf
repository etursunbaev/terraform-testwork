variable "prefix_name" {
  description = "The prefix name to use in configuration."
  type        = string
}
variable "environment" {
  description = "The environment name to use in configuration."
  type        = string
}
variable "additional_tags" {
  description = "Common Tags to be merged with main tags."
  type        = map(string)
  default     = {}
}
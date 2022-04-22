variable "prefix_name" {
  description = "The prefix name to use in configuration."
  type        = string
  default     = ""
}
variable "environment" {
  description = "The environment name to use in configuration."
  type        = string
  default     = "test"
}
variable "asg_max_size" {
  description = "The maximum size of the Auto Scaling Group."
  type        = number
  default     = 2
}
variable "asg_min_size" {
  description = "The minimum size of the Auto Scaling Group."
  type        = number
  default     = 1
}
variable "launch_config_name" {
  description = "The Launch Configuration name to use in ASG."
  type        = string
  default     = ""
}
variable "subnets" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(any)
  default     = []
}
variable "instance_type" {
  description = "The EC2 instance type to use."
  type        = string
  default     = "t2.micro"
}
variable "pub_key_name" {
  description = "The public KeyPair name."
  type        = string
  default     = ""
}
variable "root_vol_size" {
  description = "The root block device size in Gb."
  type        = number
  default     = 8
}
variable "root_vol_type" {
  description = "The root block device type."
  type        = string
  default     = "gp3"
}
variable "image_id" {
  description = "The AMI ID."
  type = string
  default = ""
}
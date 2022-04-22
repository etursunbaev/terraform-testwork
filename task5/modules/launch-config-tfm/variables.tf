variable "os_platform_owner" {
  description = "The platform owner to use in image search."
  type        = string
  default     = "amazon"
}
variable "os_platform_name" {
  description = "The image pattern to use in filter search."
  type        = string
  default     = "amzn2-ami-kernel-5.10-hvm*-x86_64-gp2"
}
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
  description = "value"
  type = string
  default = ""
}
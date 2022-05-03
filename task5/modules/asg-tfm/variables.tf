variable "environment" {
  description = "The environment name to use in configuration."
  type        = string
}
variable "prefix_name" {
  description = "The prefix name to use in configuration."
  type        = string
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
}
variable "root_vol_size" {
  description = "The root block device size in Gb."
  type        = number
  default     = 8
}
variable "root_vol_type" {
  description = "The root block device type."
  type        = string
  default     = "gp2"
}
variable "image_id" {
  description = "The AMI ID."
  type        = string
}
variable "default_image_id" {
  description = "Default AMI ID if image_id is unknown."
  type        = string
  default     = "ami-0f260fe26c2826a3d"
}
variable "user_data_template_file" {
  description = "User-Data template filename"
  type        = string
  default     = ""
}
variable "instance_profile" {
  description = "IAM Instance profile name"
  type        = string
}
variable "additional_tags" {
  description = "Common Tags to be merged with main tags."
  type        = map(string)
}
variable "security_groups" {
  description = "SG"
  type        = list(any)
}
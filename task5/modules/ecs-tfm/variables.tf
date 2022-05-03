variable "prefix_name" {
  description = "The prefix name to use in configuration."
  type        = string
}
variable "environment" {
  description = "The environment name to use in configuration."
  type        = string
}
variable "create_ecs" {
  description = "Create ECS or not?"
  type        = bool
}
variable "launch_type" {
  description = "The ECS service launch type."
  type        = string
  default     = "EC2"
}
variable "desired_count" {
  description = "Number of instances of the task definition to place and keep running."
  type        = number
  default     = 1
}
variable "additional_tags" {
  description = "Common Tags to be merged with main tags."
  type        = map(string)
  default     = {}
}
variable "ecs_task_execution_role" {
  description = "ECS task execution role ARN."
  type        = string
  default     = ""
}
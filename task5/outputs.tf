output "ecs_ami_id" {
    description = "The ECS optimized EC2 image ID."
    value = data.aws_ami.ecs_ami.image_id
}
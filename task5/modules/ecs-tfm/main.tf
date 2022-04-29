locals {
  extra_tags = merge(var.additional_tags, {
    Environment = var.environment
    },
  )
  name_end = substr(md5("${var.prefix_name}-${var.environment}-${var.launch_type}"), 0, 9)
}
resource "aws_ecs_cluster" "this_cluster" {
  name = "${var.prefix_name}-${var.environment}-cluster-${local.name_end}"
  tags = local.extra_tags
}
resource "aws_ecs_service" "this_service" {
  name            = "${var.prefix_name}-${var.environment}-service-${local.name_end}"
  cluster         = aws_ecs_cluster.this_cluster.arn
  launch_type     = var.launch_type
  task_definition = aws_ecs_task_definition.this_task.arn
  #desired_count       = var.desired_count
  scheduling_strategy = "DAEMON"
  tags                = local.extra_tags
}
resource "aws_ecs_task_definition" "this_task" {
  family                = "${var.prefix_name}-${var.environment}-task-${local.name_end}"
  task_role_arn         = var.ecs_task_execution_role
  container_definitions = file("${path.module}/templates/task-definition.json")
  tags                  = local.extra_tags
}

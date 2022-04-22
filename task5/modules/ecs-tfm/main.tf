resource "aws_ecs_cluster" "cluster" {
    name = var.cluster_name != "" ? var.cluster_name : "example"
}
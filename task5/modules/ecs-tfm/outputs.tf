output "cluster_name" {
  description = "The output of cluster name."
  value       = aws_ecs_cluster.cluster.name
}
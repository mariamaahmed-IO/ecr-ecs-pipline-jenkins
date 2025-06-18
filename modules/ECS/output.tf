output "ecs_cluster_id" {
  value = aws_ecs_cluster.webapp_cluster.id
}

output "ecs_service_name" {
  value = aws_ecs_service.webapp_service.name
}

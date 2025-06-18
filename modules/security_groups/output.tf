output "ecs_service_sg_id" {
  description = "The ID of the ECS service security group"
  value       = aws_security_group.ecs_service_sg.id
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

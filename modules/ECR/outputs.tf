output "ecr_repository_url" {
  description = "The URL of the created ECR repository"
  value       = aws_ecr_repository.webapp.repository_url
}

output "ecr_repository_arn" {
  description = "ARN of the ECR repository"
  value       = aws_ecr_repository.webapp.arn
}
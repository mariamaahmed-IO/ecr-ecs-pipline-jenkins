output "ecr_repo_url" {
  value = aws_ecr_repository.webapp.repository_url
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.webapp.name
}

output "ecs_service_name" {
  value = aws_ecs_service.webapp.name
}

output "codebuild_project_name" {
  value = aws_codebuild_project.webapp.name
}

output "codepipeline_name" {
  value = aws_codepipeline.webapp_pipeline.name
}
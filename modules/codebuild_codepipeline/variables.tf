variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "image_repo" {
  description = "ECR repo name"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
}

variable "container_name" {
  description = "ECS container name"
  type        = string
}

variable "github_repo" {
  description = "Full GitHub repo path"
  type        = string
}

variable "github_repo_name" {
  description = "GitHub repository name"
  type        = string
}

variable "github_owner" {
  description = "GitHub owner name"
  type        = string
}

variable "github_branch" {
  description = "Branch to track"
  type        = string
}

variable "github_oauth_token" {
  description = "GitHub OAuth token"
  type        = string
  sensitive   = true
}

variable "artifact_bucket" {
  description = "S3 bucket for artifacts"
  type        = string
}

variable "codebuild_role_arn" {
  description = "IAM role ARN for CodeBuild"
  type        = string
}

variable "ecs_cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "ecs_service_name" {
  description = "ECS service name"
  type        = string
}

variable "pipeline_name" {
  description = "Pipeline name"
  type        = string
}

variable "build_project_name" {
  description = "CodeBuild project name"
  type        = string
}

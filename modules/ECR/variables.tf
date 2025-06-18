
variable "tags" {
  description = "Tags to apply to the ECR repository"
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "ecr_repo_name" {
  description = "Name of the ECR repo"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
}

variable "container_name" {
  description = "Container name for ECS"
  type        = string
}

variable "github_repo_url" {
  description = "GitHub repo HTTPS URL"
  type        = string
}
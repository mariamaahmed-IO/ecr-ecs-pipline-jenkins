variable "aws_region" {
  description = "The AWS region to deploy resources."
  default     = "us-east-1"
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

# Networking
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones to use"
  type        = list(string)
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for ECS networking"
}

variable "security_group_id" {
  type        = string
  description = "Security group for ECS tasks"
}

# ECR & ECS
variable "ecr_repo_name" {
  default = "dev"
}

variable "image_tag" {
  default = "dev"
}

variable "container_name" {
  default = "webapp"
}

variable "ecs_cluster_name" {
  default = "DevCluster"
}

variable "ecs_service_name" {
  default = "DevService"
}

# GitHub
variable "github_repo_url" {
  description = "GitHub repository URL"
  type        = string
}

variable "github_owner" {
  type = string
}

variable "github_repo_name" {
  type = string
}

variable "github_branch" {
  description = "Branch to trigger pipeline from"
  type        = string
  default     = "main"
}

variable "github_token" {
  description = "GitHub PAT (can be loaded from Secrets Manager or env var)"
  type        = string
  sensitive   = true
}

# IAM
variable "name" {
  description = "Project or resource name prefix"
  type        = string
}

# S3
variable "artifact_bucket_name" {
  description = "S3 bucket name for CodePipeline artifacts"
  type        = string
}

# CodePipeline
variable "pipeline_artifact_bucket" {
  type        = string
  description = "S3 bucket for pipeline artifacts"
}

variable "pipeline_name" {
  description = "Name of the CodePipeline"
  type        = string
}

variable "build_project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

# Load Balancer
variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "task_family" {
  description = "Family name of the ECS task definition"
  type        = string
}

variable "cpu" {
  description = "CPU units for the ECS task"
  type        = string
}

variable "memory" {
  description = "Memory in MiB for the ECS task"
  type        = string
}
variable "ecs_task_execution_role_name" {
  type        = map(string)
  description = "Name of ECS task execution role"
}

variable "codebuild_role_name" {
  type        = map(string)
  description = "Name of CodeBuild IAM role"
}


# AWS Basics
aws_account_id = "173036476311"
# VPC Setup
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

cpu           = "256"
memory        = "512"
task_family   = "webapp-task"

# IAM
ecs_task_execution_role_name = "webapp-ecs-task-role"
codebuild_role_name          = "webapp-codebuild-role"

# ECR
ecr_repo_name = "dev"
image_tag     = "dev"

# ECS
container_name = "webapp"
# GitHub
github_owner    = "Mariamaahmed-IO"
github_repo_name = "cicd-automation"
github_repo_url  = "https://github.com/Mariamaahmed-IO/cicd-automation"
github_token     = "github_pat_*"  # use environment variable or Secrets Manager for production

# Pipeline
pipeline_artifact_bucket = "webapp-artifacts-mariamaahmed"
pipeline_name            = "webapp-pipeline"
build_project_name       = "webapp-build"

# Load Balancer
alb_name = "webapp-alb"

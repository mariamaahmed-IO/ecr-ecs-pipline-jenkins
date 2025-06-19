provider "aws" {
  region = var.aws_region
}

# Retrieve GitHub token securely from Secrets Manager
data "aws_secretsmanager_secret_version" "github_token" {
  secret_id = "github-token"
}

# VPC & Subnets
module "vpc" {
  source                = "../modules/VPC"
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  availability_zones    = var.availability_zones
  name                  = var.name
  tags                  = { Project = var.name }
}

# ECR
module "ecr" {
  source           = "../modules/ecr"
  ecr_repo_name    = var.ecr_repo_name
  aws_region       = var.aws_region
  github_repo_url  = var.github_repo_url
  aws_account_id   = var.aws_account_id
  image_tag        = var.image_tag
  container_name   = var.container_name
}


# 🪣 S3 for Pipeline Artifacts
module "s3" {
  source      = "../modules/s3"
  bucket_name = var.bucket_name
  tags = {
    Project = var.name
    Environment = "dev"
  }
}


# 🔐 IAM Roles
module "iam" {
  source                     = "../modules/IAM"
  ecs_task_execution_role_name = var.ecs_task_execution_role_name
  codebuild_role_name          = var.codebuild_role_name
}


# ⚖️ Application Load Balancer
module "alb" {
  source            = "../modules/alb"
  alb_name          = var.alb_name
  public_subnet_ids = module.vpc.public_subnet_ids
  vpc_id            = module.vpc.vpc_id
  tags              = { Project = var.name }
}

# 🐳 ECS Cluster & Service
module "ecs" {
  source              = "../modules/ecs"
  cluster_name        = var.ecs_cluster_name
  service_name        = var.ecs_service_name
  container_name      = var.container_name
  image_tag           = var.image_tag
  alb_listener_arn    = module.alb.listener_arn
  target_group_arn    = module.alb.target_group_arn
  vpc_id              = module.vpc.vpc_id
  task_execution_role = module.iam.ecs_task_execution_role_arn
  task_family          = var.task_family
  image_repo           = var.ecr_repo_name
  cpu                  = var.cpu
  memory               = var.memory
  aws_account_id       = var.aws_account_id
  aws_region           = var.aws_region
  execution_role_arn   = module.iam.ecs_task_execution_role_arn
  private_subnets      = module.vpc.private_subnet_ids
  security_groups      = [module.vpc.security_group_id]  # or replace with a variable

}

# 🔁 CI/CD Pipeline
module "codepipeline" {
  source               = "../modules/codebuild_codepipeline"
  build_project_name   = var.build_project_name
  pipeline_name        = var.pipeline_name
  aws_region           = var.aws_region
  aws_account_id       = var.aws_account_id
  image_repo           = var.ecr_repo_name
  image_tag            = var.image_tag
  container_name       = var.container_name
  github_repo          = var.github_repo_url
  github_owner         = var.github_owner
  github_branch        = var.github_branch
  github_oauth_token   = data.aws_secretsmanager_secret_version.github_token.secret_string
  artifact_bucket      = module.s3.bucket_name
  codebuild_role_arn   = module.iam.codebuild_role_arn
  ecs_cluster_name     = var.ecs_cluster_name
  ecs_service_name     = var.ecs_service_name
  github_repo_name     = var.github_repo_name
}

aws_region         = "us-east-1"
aws_account_id     = "173036476311"
ecr_repo_name      = "webapp-repo"
image_tag          = "latest"
container_name     = "webapp"
# GitHub
github_owner    = "Mariamaahmed-IO"
github_repo_name = "cicd-automation"
github_repo_url  = "https://github.com/Mariamaahmed-IO/cicd-automation"
github_token     = "github_pat_*"  # use environment variable or Secrets Manager for production
tags = {
  Environment = "dev"
  Project     = "webapp"
}







resource "aws_secretsmanager_secret" "github_token" {
  name        = "github-token"
  description = "GitHub token for CodePipeline access"
}

resource "aws_secretsmanager_secret_version" "github_token_version" {
  secret_id     = aws_secretsmanager_secret.github_token.id
  secret_string = var.github_token
}

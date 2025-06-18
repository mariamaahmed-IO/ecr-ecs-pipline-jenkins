variable "codebuild_role_name" {
  description = "Name of the CodeBuild IAM role"
  type        =  string
  default = "codebuild-webapp-role"

}

variable "ecs_task_execution_role_name" {
  description = "Name of the ECS task execution role"
  type        = string
  default = "ecsTaskExecutionRoleNew"

}
variable "cluster_name" {
  type        = string
  description = "ECS cluster name"
}

variable "service_name" {
  type        = string
  description = "ECS service name"
}

variable "task_family" {
  type        = string
  description = "Family name of the ECS task definition"
}

variable "cpu" {
  type        = string
  description = "CPU units for the ECS task"
}

variable "memory" {
  type        = string
  description = "Memory in MiB for the ECS task"
}

variable "container_name" {
  type        = string
  description = "Container name in the task definition"
}

variable "image_repo" {
  type        = string
  description = "ECR repo name"
}

variable "image_tag" {
  type        = string
  description = "Image tag"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_account_id" {
  type        = string
  description = "AWS account ID"
}

variable "execution_role_arn" {
  type        = string
  description = "ARN of the ECS task execution IAM role"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "security_groups" {
  type        = list(string)
  description = "Security group IDs for the ECS service"
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the ALB target group"
}
variable "alb_listener_arn" {
  description = "ALB listener ARN"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "task_execution_role" {
  description = "IAM role for ECS task execution"
  type        = string
}
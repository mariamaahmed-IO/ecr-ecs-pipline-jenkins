
# AWS Basics
aws_account_id = "173036476311"
aws_region = "us-east-1"
vpc_id = "vpc-0ec67d0f0b294cd6b"

cpu           = "256"
memory        = "512"
task_family   = "webapp-task"

# ECR
image_tag     = "dev"
# ECS
container_name = "webapp"
cluster_name = "DevCluster"
service_name= "Devservice"
execution_role_arn = "arn:aws:iam::173036476311:role/ecsTaskExecutionRoleNew"
image_repo = "173036476311.dkr.ecr.us-east-1.amazonaws.com/webapp-repo"
private_subnets = ["subnet-016b05e611c08aa7b","subnet-018d4449ef32ec7a0"]
security_groups = ["sg-05e7c59ebfd93ee6c"]
target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:173036476311:targetgroup/webappalb-tg/28bdb9e0c43f9ba5"
task_execution_role = "arn:aws:iam::173036476311:role/ecsTaskExecutionRoleNew"
alb_listener_arn = "arn:aws:elasticloadbalancing:us-east-1:173036476311:listener/app/webappalb/a8ce1be040890327/a3d4983c25d0e66b"

  
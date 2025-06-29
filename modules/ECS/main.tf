resource "aws_ecs_cluster" "webapp_cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "webapp_task" {
  family                   = var.task_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.image_repo}:${var.image_tag}"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "webapp_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.webapp_cluster.id
  task_definition = aws_ecs_task_definition.webapp_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnets
    security_groups  = var.security_groups
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = 80
  }

  depends_on = [aws_ecs_task_definition.webapp_task]
}

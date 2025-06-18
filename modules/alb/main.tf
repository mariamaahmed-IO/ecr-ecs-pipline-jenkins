resource "aws_lb" "webappalb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups    = var.security_groups

  tags = merge(var.tags, {
    Name = var.alb_name
  })
}

resource "aws_lb_target_group" "webapp_tg" {
  name     = "${var.alb_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"  # for fargate compatible with awsvpc mode


  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = merge(var.tags, {
    Name = "${var.alb_name}-tg"
  })
}

resource "aws_lb_listener" "webapp_listener" {
  load_balancer_arn = aws_lb.webappalb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webapp_tg.arn
  }
}

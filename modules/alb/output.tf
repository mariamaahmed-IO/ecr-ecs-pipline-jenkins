output "alb_dns_name" {
  value = aws_lb.webappalb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.webapp_tg.arn
}

output "listener_arn" {
  value = aws_lb_listener.webapp_listener.arn
}
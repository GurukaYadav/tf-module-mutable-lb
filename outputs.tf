output "PUBLIC_LB_ARN" {
  value = aws_lb.public.arn
}

output "PRIVATE_LB_ARN" {
  value = aws_lb.private.arn
}

output "PRIVATE_LB_DNS_NAME" {
  value = aws_lb.private.dns_name
}

output "PRIVATE_LISTENER_ARN" {
  value = aws_lb_listener.backend.arn
}
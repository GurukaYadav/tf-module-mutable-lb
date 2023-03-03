resource "aws_route53_record" "replacing_lb_dns_new_dns" {
  zone_id = var.PUBLIC_HOSTED_ZONE_ID
  name    = "*.devops65.online"
  type    = "CNAME"
  ttl     = 300
  records = [aws_lb.public.dns_name]
}







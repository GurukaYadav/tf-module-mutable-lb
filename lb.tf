resource "aws_lb" "public" {
  name               = "${local.TAG_NAME}-public-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.pub-sg.id]
  subnets            = var.PUBLIC_SUBNET_ID

  tags = {
    Environment = "${local.TAG_NAME}-public-lb"
  }
}

//adding the frontend end instance target grp to public lb
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.public.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:124374336606:certificate/534f69be-bcc8-444e-9eb3-973a2f0d10d3"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-grp.arn
  }
}


resource "aws_lb" "private" {
  name               = "${local.TAG_NAME}-private-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.pri-sg.id]
  subnets            = var.PRIVATE_SUBNET_ID

  tags = {
    Environment = "${local.TAG_NAME}-private-lb"
  }
}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.private.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}
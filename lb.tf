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
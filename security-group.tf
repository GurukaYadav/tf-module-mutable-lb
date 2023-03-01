resource "aws_security_group" "pub-sg" {
  name        = "${local.TAG_NAME}-public-lb-sg"
  description = "Allow TCP inbound traffic"
  vpc_id      = var.VPC_ID

  ingress {
    description      = "HTTPS"
    from_port        = var.PUB_PORT
    to_port          = var.PUB_PORT
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.TAG_NAME}-public-lb-sg"
  }

}

resource "aws_security_group" "pri-sg" {
  name        = "${local.TAG_NAME}-private-lb-sg"
  description = "Allow TCP inbound traffic"
  vpc_id      = var.VPC_ID

  ingress {
    description      = "HTTP"
    from_port        = var.PRI_PORT
    to_port          = var.PRI_PORT
    protocol         = "tcp"
    cidr_blocks      = var.PRIVATE_SUBNET_CIDR
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.TAG_NAME}-private-lb-sg"
  }

}
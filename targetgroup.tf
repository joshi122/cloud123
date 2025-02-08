resource "aws_lb_target_group" "test" {
  name     = "terfm-lbtg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.terraform.id
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_lb" "main" {
  name               = "${var.project_name}-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [aws_subnet.public.id]
}

resource "aws_lb_target_group" "target" {
  name    = "${var.project_name}-tg"
  port    = 80
  protcol = "http"
  vpc_id  = aws.vpc.main.id
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protcol           = "http"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}
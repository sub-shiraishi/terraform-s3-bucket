#ALB SG
resource "aws_security_group" "alb" {
  name   = "${var.project_name}-alb-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port  = 80
    to_port    = 80
    protcol    = "tcp"
    cidr_block = ["0.0.0.0/0"]
  }
  egress {
    from_port  = 0
    to_port    = 0
    protcol    = "-1"
    cidr_block = ["0.0.0.0/0"]
  }
}

#EC2 SG
resource "aws_security_group" "ec2" {
  name   = "${var.project_name}-ec2-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port  = 80
    to_port    = 80
    protcol    = "tcp"
    cidr_block = ["0.0.0.0/0"]
  }
  egress {
    from_port  = 0
    to_port    = 0
    protcol    = "-1"
    cidr_block = ["0.0.0.0/0"]
  }
}
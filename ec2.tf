data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private.id

  vpc_security_group_ids = [aws_security_group.ec2.id]

  user_data = <<EOF
#! /bin/bash
dnf install -y nginx
systemctl start nginx
EOF
}

resource "aws_lb_target_group_attachment" "ec2" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.instance.id
  port             = 80
}
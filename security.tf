resource "aws_security_group" "cluster_sg" {
  name        = "cluster_sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_default_vpc.default.id
  

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      description      = "80 from VPC"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "cluster_sg"
  }
}

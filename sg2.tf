resource "aws_security_group" "ec2_demo_sg-2" {
  name        = "ec2_demo_allow_http_sg-2"
  description = "Allow HTTP inbound traffic"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_http-2"
  }

}
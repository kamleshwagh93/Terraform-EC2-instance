resource "aws_instance" "ec2_demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = "subnet-0ffa2fc500aeb5db8"
  vpc_security_group_ids = [aws_security_group.ec2_demo_sg-1.id, aws_security_group.ec2_demo_sg-2.id]

  tags = {
    Name = "Created_By_Terraform_Automation"
  }

  root_block_device {
    tags = {
    Name = "Resized Volume" }
    volume_size = 10
    # (8 unchanged attributes hidden)
    delete_on_termination = true
  }

  user_data = <<-EOF
              #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Welcome to Terraform Demo!!!, I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
              EOF

}


/*resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.ec2_demo.id
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-south-1a"
  size              = 8
  tags = {
    Name = "Extra_Volume"
  }
}*/
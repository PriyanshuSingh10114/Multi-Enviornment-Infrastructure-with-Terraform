# KEY PAIR
resource "aws_key_pair" "my_key_new" {
  key_name   = "${var.env}-infra-app-key"
  public_key = var.public_key


  tags={
    Enviornment=var.env
  }
}
# DEFAULT VPC
resource "aws_default_vpc" "default" {}

# SECURITY GROUP
resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app-sg"
  description = "EC2 Security Group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound"
  }

  tags = {
    Name = "${var.env}-infra-app-sg"
  }
}

# EC2 INSTANCE
resource "aws_instance" "my_instance" {

  count=var.instance_count
  ami           = var.ec2_ami_id
  instance_type = var.instance_type

  key_name = aws_key_pair.my_key_new.key_name

  vpc_security_group_ids = [aws_security_group.my_security_group.id]


  root_block_device {
    volume_size = var.env == "prd" ? 20 : 10
    volume_type = "gp3"
  }

  depends_on = [
    aws_security_group.my_security_group,
    aws_key_pair.my_key_new
  ]

  tags = {
    Name = "${var.env}-infra-app-instance"
    Enviornment=var.env
  }
}

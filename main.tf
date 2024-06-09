
provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-web-simple"
    key            = "services/web-simple"
    region         = "us-east-2"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}

resource "aws_security_group" "allow_web_ssh" {
  name        = "allow_web_ssh"
  description = "Allow Web and SSH inbound traffic"

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_ssh"
  }
}


resource "aws_instance" "web-simple-server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.allow_web_ssh.name]

  // Specify the name of the existing key pair
  key_name = var.key_pair_name

  // Load user data from a local shell script file
  user_data = file("deploy/setup.sh")

  // Add iam instance profilee 
  iam_instance_profile = "EC2SSM"

  tags = {
    app = "web-simple"
  }
}


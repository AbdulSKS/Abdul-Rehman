#Compute Instance
provider "aws" {
  region = "ap-south-1"
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "default" {
  name        = "launch-wizard-1"
  description = "Launch-wizard-1 security group"
  vpc_id      = aws_default_vpc.default.id

  // Add inbound and outbound rules as needed
  ingress {
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
}
resource "aws_instance" "Compute_instance" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"

  tags = {
    Name = "Compute-instance-by-AbdulRehman"
  }
}

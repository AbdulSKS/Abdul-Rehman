#Compute Instance
provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAXH3TM123N2QZIR"
  secret_key = "4GpMVTODTbB123eY7mwWv+bhl1iWGLaknbQyroMS"
}

resource "aws_instance" "Compute_instance" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"

  tags = {
    Name = "Compute-instance-by-AbdulRehman"
  }
}

#Load Balancer
resource "aws_elb" "abdulrehman_elb" {
  name               = "abdulrehman-elb"
  availability_zones = ["ap-south-1a", "ap-south-1b"]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 3
    unhealthy_threshold = 2
    healthy_threshold   = 2
  }

  instances = [aws_instance.Compute_instance.id]
}

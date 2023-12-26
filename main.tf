#Compute Instance 
provider "aws" {
  region = "ap-south-1" 
}

resource "aws_instance" "example_instance" {
  ami           = "ami-03f4878755434977f" 
  instance_type = "t2.micro"              

  tags = {
    Name = "Compute-instance-of-ubuntu"
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

  instances = [aws_instance.example_instance.id]
}

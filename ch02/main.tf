provider "aws" {
  region = "us-east-2"
}

# resource "aws_instance" "jurassic" {
#   ami = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.instance.id]

#  user_data = <<-EOF
# `             #!/bin/bash
#              echo "Hello, beasties" > index.html
#              nohup busybox httpd -f -p ${var.server_port} &
#              EOF

#  tags = {
#    Name = "terrform-example"
#  }
# }

resource "aws_launch_configuration" "jurassic" {
  image_id = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, beasties" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  # Required when using launch configurations with asg
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_autoscaling_group" "jurassic" {
  launch_configuration = aws_launch_configuration.jurassic.name
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids

  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"

  min_size = 2
  max_size = 10

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }

}
 
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group" "instance" {

  name = "terraform-example-instance"
  
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }  

}

variable "server_port" {
  description = "Port that will be use for HTTP"
  type = number
  default = 8080
}

# output "public_ip" {
#   value = aws_instance.jurassic.public_ip
#   description = "the public ip of the web server"
# }

output "alb_dns_name" {
  value = aws_lb.jurassic.dns_name
  description = "the domain name of the load balancer"
}

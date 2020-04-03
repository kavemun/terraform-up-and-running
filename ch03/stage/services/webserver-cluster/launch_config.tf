resource "aws_launch_configuration" "jurassic" {
  image_id = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instance.id]

  user_data = data.template_file.user_data.rendered

  # Required when using launch configurations with asg
  lifecycle {
    create_before_destroy = true
  }
}


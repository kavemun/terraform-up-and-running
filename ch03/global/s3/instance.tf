resource "aws_instance" "instance-01" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

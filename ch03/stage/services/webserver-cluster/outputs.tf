# output "public_ip" {
#   value = aws_instance.jurassic.public_ip
#   description = "the public ip of the web server"
# }

output "alb_dns_name" {
  value = aws_lb.jurassic.dns_name
  description = "the domain name of the load balancer"
}


# output "public_ip" {
#   value = aws_instance.jurassic.public_ip
#   description = "the public ip of the web server"
# }

output "asg_name" {
  value       = aws_autoscaling_group.jurassic.name
  description = "The name of the ASG"
}

output "alb_dns_name" {
  value       = aws_lb.jurassic.dns_name
  description = "The domain name of the load balancer"
}

output "alb_security_group_id" {
  value       = aws_security_group.alb.id
  description = "The ID of the Security Group attached to the Load Balancer"
}

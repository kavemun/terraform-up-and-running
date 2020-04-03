variable "server_port" {
  description = "Port that will be use for HTTP"
  type = number
  default = 8080
}

variable "cluster_name" {
  description   = "The name to use for all the cluster resource"
  type          = string
}

variable "db_remote_state_bucket" {
  description   = "The name of the S3 bucket for the DB remote state"
  type          = string
}

variable "db_remote_state_key" {
  description   = "The path for the db's remote state in S3"
  type          = string
}

variable "instance_type" {
  description   = "The type of EC2 instance"
  type          = string
}

variable "min_size" {
  description   = "The minimum number of EC2 instance in ASG."
  type          = number
}

variable "max_size" {
  description   = "The maximum number of EC2 instnce in ASG"
  type          = number
}

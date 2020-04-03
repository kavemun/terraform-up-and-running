variable "db_password" {
  description = "The password for db"
  type        = string
}

variable "db_name" {
  description = "The name for db"
  type        = string
  default     = "terra_db"
}

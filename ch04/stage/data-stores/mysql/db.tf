resource "aws_db_instance" "aws-db" {
  identifier_prefix   = "terra-up-running"
  engine              = "mysql"
  allocated_storage  = 10
  instance_class      = "db.t2.micro"

  username            = "admin"

#   password            = data.aws_secretmanager_secret_version.db_password.secret_string
  name                = var.db_name
  skip_final_snapshot = true
  password            = var.db_password
}

# data "aws_secretsmanager_secret_version" "db_password" {
#   secret_id = "mysql-master-password-stage"
# }

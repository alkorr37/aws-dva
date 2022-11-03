resource "random_password" "password" {
  length = 8
  special = false
  upper = false
  lower  = false
}

resource "aws_db_instance" "rds" {
  db_name                = "TestDb"
  instance_class         = "db.t3.micro"
  engine                 = "postgres"
  username               = "alkor"
  password               = random_password.password.result
  allocated_storage      = 20
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.ssh_http_rds.id]
}
output "EC2_IpAddr" {
  value = aws_instance.terraform-ec2.public_ip
}

output "DB_Host" {
  value = aws_db_instance.rds.address
}

output "DB_Port" {
  value = aws_db_instance.rds.port
}

output "DB_Password" {
  value = nonsensitive(aws_db_instance.rds.password)
}
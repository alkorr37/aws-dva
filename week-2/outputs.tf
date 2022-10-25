output "IpAddr" {
  value = aws_instance.terraform-ec2.public_ip
}
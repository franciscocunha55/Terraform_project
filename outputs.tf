output "instance_public_ip_addr" {
  value = aws_instance.frontend.public_ip
}
resource "aws_instance" "server1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet_public[0].id
  key_name = var.key_name
  user_data = base64encode(data.template_file.init.rendered)

  tags = {
    Name = "instance${local.project_name}"
  }
}


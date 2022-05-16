resource "aws_ami_from_instance" "ami_from_web_server" {
  name               = "ami_from_web_server"
  source_instance_id = aws_instance.frontend.id

  tags = {
    Name = "ami_from_web_server"
  }
}
resource "aws_ami_copy" "copy_ami_web_server" {
  name              = "web-server-encrypted"
  description       = "web-server-encrypted"
  source_ami_id     = aws_ami_from_instance.ami_from_web_server.id
  source_ami_region = var.region
  encrypted = "true"


  tags = {
    Name = "web-server-encrypted"
  }
}
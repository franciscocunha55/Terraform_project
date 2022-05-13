resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t3.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
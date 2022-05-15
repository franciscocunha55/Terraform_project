resource "aws_instance" "jumper" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet_public[0].id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_jumper.id]
  user_data = base64encode(data.template_file.init.rendered)
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  tags = {
    Name = "instance${local.project_name}"
  }
}

### Security Group ###

resource "aws_security_group" "sg_jumper" {
  name        = "sg_${var.project}-${var.environment}"
  description = "Allow SSH to jumper"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["94.61.122.99/32"]
    description = "Home/Office/VPN Access"
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-${var.project}-${var.environment}"
  }
}


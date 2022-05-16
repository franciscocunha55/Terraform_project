resource "aws_instance" "frontend" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet_public[0].id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_frontend.id]
  user_data = base64encode(data.template_file.init.rendered)
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ips.txt"
  }

  tags = {
    Name = "frontend_${local.project_name}"
  }
}

resource "aws_instance" "jumper" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet_private[0].id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.sg-ssh-internal.id]
  associate_public_ip_address = "false"

  tags = {
    Name = "jumper_${local.project_name}"
  }
}

### Instance from encrypted snapshot ###

resource "aws_instance" "encrypted_web_server" {
  ami           = aws_ami_copy.copy_ami_web_server.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet_public[0].id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_frontend.id]
  user_data = base64encode(data.template_file.init_encrypted.rendered)
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ips.txt"
  }

  tags = {
    Name = "encrypted_web_server_${local.project_name}"
  }
}


### Security Group ###

resource "aws_security_group" "sg_frontend" {
  name        = "sg_frontend-${var.environment}"
  description = "Allow SSH to jumper"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.francisco_IP]
    description = "Home/Office/VPN Access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Access Nginx"
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-frontend-${var.environment}"
  }
}

resource "aws_security_group" "sg-ssh-internal" {
  name        = "sg_ssh-internal-${var.environment}"
  description = "Allow SSH to jumper"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.sg_frontend.id]
    description = "Home Access"
  }


  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_ssh-internal-${var.environment}"
  }
}

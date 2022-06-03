resource "aws_db_instance" "rds_instance" {
  snapshot_identifier = data.aws_db_snapshot.db_snapshot.id
  db_subnet_group_name = aws_db_subnet_group.subnet_group.id
  instance_class = "db.t2.micro"

  vpc_security_group_ids = [aws_db_security_group.default.id]
}

resource "aws_db_security_group" "default" {
  name = "db_sg"
  ingress {
    cidr = "10.0.2.0/24"
  }
}


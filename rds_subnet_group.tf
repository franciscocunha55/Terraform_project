resource "aws_db_subnet_group" "subnet_group" {
  subnet_ids = [aws_subnet.subnet_private[0].id, aws_subnet.subnet_private[1].id ]
  name = "main"

  tags = {
    Name = "Subnet_group_private"
  }
}
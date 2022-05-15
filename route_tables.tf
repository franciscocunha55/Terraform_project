resource "aws_route_table" "rt_public_subnet" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt_public_subnet"
  }
}

resource "aws_route_table_association" "rt_assoc_public_subnet" {
  count = length(aws_subnet.subnet_public)
  subnet_id      = aws_subnet.subnet_public[count.index].id
  route_table_id = aws_route_table.rt_public_subnet.id
}
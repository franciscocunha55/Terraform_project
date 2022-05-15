resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "vpc_1"
  }
}

resource "aws_subnet" "subnet_public" {
  count = 2
  cidr_block = "10.0.3.${(2+count.index)*64}/26"
  vpc_id     = aws_vpc.my_vpc.id
  map_public_ip_on_launch= true
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "subnet_public-${(count.index+1)}"
  }
}

resource "aws_subnet" "subnet_private" {
  count = 2
  cidr_block = "10.0.3.${(count.index)*64}/26"
  vpc_id     = aws_vpc.my_vpc.id
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "subnet_private-${(count.index+1)}"
  }
}

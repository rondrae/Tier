resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc_01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = " Public Route Table"
  }
}


resource "aws_route_table_association" "pub_rt_association" {
  subnet_id = aws_subnet.public_web_sub_01.id
  route_table_id = aws_route_table.pub_rt.id
}
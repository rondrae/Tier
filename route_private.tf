resource "aws_route_table" "private_rt_table" {
  vpc_id = aws_vpc.vpc_01.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eip_natgw.id
  }
}

###----Route Association for App Tier---####

resource "aws_route_table_association" "nat_route_app_1" {
  subnet_id      = aws_subnet.private_app_sub_01.id
  route_table_id = aws_route_table.private_rt_table.id
}

resource "aws_route_table_association" "nat_route_app_2" {
  subnet_id      = aws_subnet.private_app_sub_02.id
  route_table_id = aws_route_table.private_rt_table.id
}

###----Route Association for DB Tier---####

resource "aws_route_table_association" "nat_route_db_1" {
  subnet_id      = aws_subnet.private_db_sub_01.id
  route_table_id = aws_route_table.private_rt_table.id
}

resource "aws_route_table_association" "nat_route_db_2" {
  subnet_id      = aws_subnet.private_db_sub_02.id
  route_table_id = aws_route_table.private_rt_table.id
}
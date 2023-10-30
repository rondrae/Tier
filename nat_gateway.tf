resource "aws_eip" "eip_natgw" {


  tags = {
    Name = "elastic IP"
  }
}

resource "aws_nat_gateway" "eip_natgw" {
  allocation_id = aws_eip.eip_natgw.id
  subnet_id     = aws_subnet.public_web_sub_02.id

  tags = {
    Name = "Nat gateway"
  }
}
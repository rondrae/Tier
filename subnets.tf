###----Public Subnets-------###############

resource "aws_subnet" "public_web_sub_01" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.public_web_sub_01_cidr
  availability_zone = "ca-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "public_web_sub_02" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.public_web_sub_02_cidr
  availability_zone = "ca-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 2"
  }
}



############-Private Subnet 02----###########

resource "aws_subnet" "private_app_sub_01" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private_app_sub_01-cidr
  availability_zone = "ca-central-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private subnet 1 - App Tier"
  }
}


resource "aws_subnet" "private_app_sub_02" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private_app_sub_02-cidr
  availability_zone = "ca-central-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private subnet 2 - App Tier"
  }
}


#####----DB Subnets---#########


resource "aws_subnet" "private_db_sub_01" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private_db_sub_01-cidr
  availability_zone = "ca-central-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private subnet 1 - DB Tier"
  }
}

resource "aws_subnet" "private_db_sub_02" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private_db_sub_02-cidr
  availability_zone = "ca-central-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private subnet 2 - DB Tier"
  }
}



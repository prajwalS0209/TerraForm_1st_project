resource "aws_subnet" "public"{
  vpc_id     = var.vpc_id
  cidr_block = var.public_cidr
  availability_zone = var.zone-a
   tags = {
    name = "public"
  } 
}
resource "aws_subnet" "private"{
  vpc_id     = var.vpc_id
  cidr_block = var.private_cidr
  availability_zone = var.zone-b
   tags = {
    name = "private"
  } 
}

resource "aws_nat_gateway" "my-nat" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private.id
}  

resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "my-RT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "assoc1" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.my-RT.id
}

resource "aws_route_table_association" "assoc2" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.my-RT.id
}



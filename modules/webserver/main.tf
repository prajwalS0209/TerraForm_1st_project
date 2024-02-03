resource "aws_instance" "demo-server-1" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet

  tags = {
    name = "public"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.demo-server-1.id
  domain   = "vpc"
}

resource "aws_instance" "demo-server-2" {

  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.private_subnet

  tags = {
    name = "private"
  }
}
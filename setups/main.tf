provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "practice-vpc"
  }
}

module "network" {
  source = "../modules/network"
  vpc_id = aws_vpc.main.id
  public_cidr = "10.0.0.0/24"
  private_cidr = "10.0.1.0/24"
  zone-a = "ap-south-1a"
  zone-b = "ap-south-1b"
}

module "instances" {
  source = "../modules/webserver"
  instance_type = "t2.micro"
  ami = "ami-02e94b011299ef128"
  public_subnet = module.network.public_subnet_id
  private_subnet = module.network.private_subnet_id
}



resource "aws_vpc" "terraform" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-terraform"
  }
}



resource "aws_subnet" "http" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = var.network_http["cidr"]
  tags = {
    Name = "subnet-http"
  }
  depends_on = [aws_internet_gateway.gw]
}


resource "aws_subnet" "db" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = var.network_db["cidr"]
  tags = {
    Name = "subnet-db"
  }
  depends_on = [aws_internet_gateway.gw]
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform.id
  tags = {
    Name = "internet-gateway"
  }
}



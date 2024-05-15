# modules/network/main.tf
resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "public" {
  cidr_block = var.public_cidr_block
  vpc_id     = aws_vpc.this.id
  availability_zone = var.availability_zone
}

resource "aws_subnet" "private" {
  cidr_block = var.private_cidr_block
  vpc_id     = aws_vpc.this.id
  availability_zone = var.availability_zone
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
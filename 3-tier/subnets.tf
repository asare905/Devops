resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.multitier_vpc.id
  cidr_block = var.publi_web_1_cidr
  availability_zone = var.zone-1
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.multitier_vpc.id
  cidr_block = var.publi_web_2_cidr
  availability_zone = var.zone-2
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id     = aws_vpc.multitier_vpc.id
  cidr_block = var.publi_web_3_cidr
  availability_zone = var.zone-3
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_3"
  }
}

resource "aws_subnet" "php_subnet_1" {
  vpc_id     = aws_vpc.multitier_vpc.id
  cidr_block = var.app_1_cidr
  availability_zone = var.zone-1
  map_public_ip_on_launch = true
  tags = {
    Name = "php_subnet_1"
  }
}

resource "aws_subnet" "php_subnet_2" {
  vpc_id     = aws_vpc.multitier_vpc.id
  cidr_block = var.app_2_cidr
  availability_zone = var.zone-2
  map_public_ip_on_launch = true
  tags = {
    Name = "php_subnet_2"
  }
}

resource "aws_subnet" "php_subnet_3" {
  vpc_id     = aws_vpc.multitier_vpc.id
  cidr_block = var.app_3_cidr
  availability_zone = var.zone-3
  map_public_ip_on_launch = true
  tags = {
    Name = "php_subnet_3"
  }
}

resource "aws_subnet" "db_subnet_1" {
  vpc_id     = aws_vpc.multitier_vpc.id
  cidr_block = var.db_1_cidr
  availability_zone = var.zone-1
  map_public_ip_on_launch = true
  tags = {
    Name = "db_subnet_1"
  }
}

resource "aws_subnet" "db_subnet_2" {
  vpc_id     = aws_vpc.multitier_vpc.id
  cidr_block = var.db_2_cidr
  availability_zone = var.zone-2
  map_public_ip_on_launch = true
  tags = {
    Name = "db_subnet_2"
  }
}

resource "aws_subnet" "db_subnet_3" {
  vpc_id     = aws_vpc.multitier_vpc.id
  cidr_block = var.db_3_cidr
  availability_zone = var.zone-3
  map_public_ip_on_launch = true
  tags = {
    Name = "db_subnet_3"
  }
}
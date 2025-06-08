resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.container_vpc.id
  cidr_block = var.publi_web_1_cidr
  availability_zone = var.zone-1
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_1"
  }
}

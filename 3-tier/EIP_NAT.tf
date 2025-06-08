#CREATING IP AND NAT GATEWAY FOR ZONE 1
resource "aws_eip" "eip_1" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "az1_nat" {
  allocation_id = aws_eip.eip_1.id
  subnet_id     = aws_subnet.public_subnet_1.id
  
  tags = {
    Name = "az1_nat"
  }
  depends_on = [ aws_internet_gateway.multitier_igw ]

}


#CREATING IP AND NAT GATEWAY FOR ZONE 2
resource "aws_eip" "eip_2" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "az2_nat" {
  allocation_id = aws_eip.eip_2.id
  subnet_id     = aws_subnet.public_subnet_2.id

  tags = {
    Name = "az2_nat"
  }
  depends_on = [ aws_internet_gateway.multitier_igw ]

}


#CREATING IP AND NAT GATEWAY FOR ZONE 3
resource "aws_eip" "eip_3" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "az3_nat" {
  allocation_id = aws_eip.eip_3.id
  subnet_id     = aws_subnet.public_subnet_3.id

  tags = {
    Name = "az3_nat"
  }
  depends_on = [ aws_internet_gateway.multitier_igw ]

}
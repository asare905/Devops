resource "aws_route_table" "public_web_rt" {
  vpc_id = aws_vpc.multitier_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.multitier_igw.id
  }

  tags = {
    Name = "public_web_rt"
  }
}

resource "aws_route_table_association" "public_web1_rta" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public_web_rt.id
    
}

resource "aws_route_table_association" "public_web2_rta" {
    subnet_id = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.public_web_rt.id
    
}

resource "aws_route_table_association" "public_web3_rta" {
    subnet_id = aws_subnet.public_subnet_3.id
    route_table_id = aws_route_table.public_web_rt.id
    
}


#ROUTE TABLE AND ASSOCIATION FOR PRIVATE SUBNETS IN AZ 1
resource "aws_route_table" "private_rt1" {
  vpc_id = aws_vpc.multitier_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.az1_nat.id
  }

  tags = {
    Name = "private_rt1"
  }
}

resource "aws_route_table_association" "az1_php_rta" {
    subnet_id = aws_subnet.php_subnet_1.id
    route_table_id = aws_route_table.private_rt1.id
    
}

resource "aws_route_table_association" "az1_db_rta" {
    subnet_id = aws_subnet.db_subnet_1.id
    route_table_id = aws_route_table.private_rt1.id
    
}



#ROUTE TABLE AND ASSOCIATION FOR PRIVATE SUBNETS IN AZ 2
resource "aws_route_table" "private_rt2" {
  vpc_id = aws_vpc.multitier_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.az2_nat.id
  }

  tags = {
    Name = "private_rt2"
  }
}

resource "aws_route_table_association" "az2_php_rta" {
    subnet_id = aws_subnet.php_subnet_2.id
    route_table_id = aws_route_table.private_rt2.id
    
}

resource "aws_route_table_association" "az2_db_rta" {
    subnet_id = aws_subnet.db_subnet_2.id
    route_table_id = aws_route_table.private_rt2.id
    
}



#ROUTE TABLE AND ASSOCIATION FOR PRIVATE SUBNETS IN AZ 3
resource "aws_route_table" "private_rt3" {
  vpc_id = aws_vpc.multitier_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.az3_nat.id
  }

  tags = {
    Name = "private_rt3"
  }
}

resource "aws_route_table_association" "az3_php_rta" {
    subnet_id = aws_subnet.php_subnet_3.id
    route_table_id = aws_route_table.private_rt3.id
    
}

resource "aws_route_table_association" "az3_db_rta" {
    subnet_id = aws_subnet.db_subnet_3.id
    route_table_id = aws_route_table.private_rt3.id
    
}



resource "aws_security_group" "jumpserver-sg" {
  name        = "jumpserver-sg"
  description = "jumpserver-sg"
  vpc_id      = aws_vpc.multitier_vpc.id

  tags = {
    Name = "jumpserver-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.jumpserver-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.jumpserver-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.jumpserver-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


#CREATE A JUMPSERVER IN EACH OF THE AZ
resource "aws_instance" "jumpserver_zone1" {
  ami           = var.ec2_ami
  instance_type = var.ec2_inztance_type_t2
  subnet_id     = aws_subnet.public_subnet_1.id
  key_name = var.ec2_keyname
  availability_zone = var.zone-1
  vpc_security_group_ids = [ aws_security_group.jumpserver-sg.id ]
}

resource "aws_instance" "jumpserver_zone2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_inztance_type_t2
  subnet_id     = aws_subnet.public_subnet_2.id
  key_name = var.ec2_keyname
  availability_zone = var.zone-2
  vpc_security_group_ids = [ aws_security_group.jumpserver-sg.id ]
}

resource "aws_instance" "jumpserver_zone3" {
  ami           = var.ec2_ami
  instance_type = var.ec2_inztance_type_t2
  subnet_id     = aws_subnet.public_subnet_3.id
  key_name = var.ec2_keyname
  availability_zone = var.zone-3
  vpc_security_group_ids = [ aws_security_group.jumpserver-sg.id ]
}
######### CREATING DB INSTANCE
resource "aws_db_instance" "db-server-1" {
  allocated_storage       = 20
  db_name                 = "mydb"
  identifier              = "db-server-1"
  engine                  = var.db_engine
  instance_class          = var.db_instance_class
  username                = var.db_username
  password                = var.db_username_pswd
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.my-db-subnet-group.id
  vpc_security_group_ids  = [aws_security_group.db-server-sg.id]
  multi_az = true
  publicly_accessible     = false
  

  tags = {
    Name = "db-server-1"
  }
}


################################################################
## RECORDING ENDPOINT OF DB SERVER1
##############################################################
data "aws_db_instance" "db_instance" {
  db_instance_identifier = aws_db_instance.db-server-1.identifier
}

#### CREATING DB SUBNET GROUP
resource "aws_db_subnet_group" "my-db-subnet-group" {
  name = "my-db-subnet-group"
  subnet_ids = [
    aws_subnet.db_subnet_1.id, 
    aws_subnet.db_subnet_2.id, 
    aws_subnet.db_subnet_3.id
  ]

  tags = {
    Name = "multitier-DB-Subnet-Group"
  }
}

######## CREATING DB SERVER SECURITY GROUP
resource "aws_security_group" "db-server-sg" {
  name        = "db-server-sg"
  description = "db-server-sg"
  vpc_id      = aws_vpc.multitier_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [ aws_security_group.php-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-server-sg"
  }
}

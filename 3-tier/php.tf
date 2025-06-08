

resource "aws_key_pair" "multi-tier" {
  key_name   = "multi-tier"
  public_key = file("multi-tier.pub")
}







#SECURITY GROUP FOR PHP SERVER
resource "aws_security_group" "php-sg" {
    name = "php-sg"
    vpc_id = aws_vpc.multitier_vpc.id


ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [ aws_security_group.alb-sg.id ]
  }

ingress {
    security_groups = [ aws_security_group.jumpserver-sg.id ]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  
  }

ingress {
    security_groups = [ aws_security_group.jumpserver-sg.id ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
egress {
    cidr_blocks = [ "0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }



}


resource "aws_instance" "php-server-1" {
  ami               = var.ec2_ami
  instance_type     = var.ec2_inztance_type_t2
  key_name          = var.ec2_keyname
  vpc_security_group_ids = [aws_security_group.php-sg.id]
  subnet_id         = aws_subnet.php_subnet_1.id
  availability_zone = var.zone-1
  associate_public_ip_address = false

  tags = {
    Name = "php-server-1"
  }

  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo amazon-linux-extras install php8.2
  sudo yum install -y httpd php-mysqlnd php-mbstring php-xml
  sudo systemctl start httpd
  sudo systemctl enable httpd
  sudo usermod -a -G apache ec2-user
  sudo chown -R ec2-user:apache /var/www
  sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
  sudo find /var/www -type f -exec sudo chmod 0664 {} \;
  sudo wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
  sudo mkdir -p /var/www/html/phpMyAdmin
  sudo tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C /var/www/html/phpMyAdmin --strip-components 1
  sudo rm phpMyAdmin-latest-all-languages.tar.gz
  sudo cp /var/www/html/phpMyAdmin/config.sample.inc.php /var/www/html/phpMyAdmin/config.inc.php
  sudo sed -i "s/localhost/${aws_db_instance.db-server-1.endpoint}/" /var/www/html/phpMyAdmin/config.inc.php
  sudo rm -f /var/www/html/index.html
  sudo systemctl restart httpd




  EOF
}






resource "aws_instance" "php-server-2" {
  ami               = var.ec2_ami
  instance_type     = var.ec2_inztance_type_t2
  key_name          = var.ec2_keyname
  vpc_security_group_ids = [aws_security_group.php-sg.id]
  subnet_id         = aws_subnet.php_subnet_2.id
  availability_zone = var.zone-2
  associate_public_ip_address = false

  tags = {
    Name = "php-server-2"
  }


  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo amazon-linux-extras install php8.2
  sudo yum install -y httpd php-mysqlnd php-mbstring php-xml
  sudo systemctl start httpd
  sudo systemctl enable httpd
  sudo usermod -a -G apache ec2-user
  sudo chown -R ec2-user:apache /var/www
  sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
  sudo find /var/www -type f -exec sudo chmod 0664 {} \;
  sudo wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
  sudo mkdir -p /var/www/html/phpMyAdmin
  sudo tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C /var/www/html/phpMyAdmin --strip-components 1
  sudo rm phpMyAdmin-latest-all-languages.tar.gz
  sudo cp /var/www/html/phpMyAdmin/config.sample.inc.php /var/www/html/phpMyAdmin/config.inc.php
  sudo sed -i "s/localhost/${aws_db_instance.db-server-1.endpoint}/" /var/www/html/phpMyAdmin/config.inc.php
  sudo rm -f /var/www/html/index.html
  sudo systemctl restart httpd




  EOF



  


}






resource "aws_instance" "php-server-3" {
  ami               = var.ec2_ami
  instance_type     = var.ec2_inztance_type_t2
  key_name          = var.ec2_keyname
  vpc_security_group_ids = [aws_security_group.php-sg.id]
  subnet_id         = aws_subnet.php_subnet_3.id
  availability_zone = var.zone-3
  associate_public_ip_address = false

  tags = {
    Name = "php-server-3"
  }



user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo amazon-linux-extras install php8.2
  sudo yum install -y httpd php-mysqlnd php-mbstring php-xml
  sudo systemctl start httpd
  sudo systemctl enable httpd
  sudo usermod -a -G apache ec2-user
  sudo chown -R ec2-user:apache /var/www
  sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
  sudo find /var/www -type f -exec sudo chmod 0664 {} \;
  sudo wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
  sudo mkdir -p /var/www/html/phpMyAdmin
  sudo tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C /var/www/html/phpMyAdmin --strip-components 1
  sudo rm phpMyAdmin-latest-all-languages.tar.gz
  sudo cp /var/www/html/phpMyAdmin/config.sample.inc.php /var/www/html/phpMyAdmin/config.inc.php
  sudo sed -i "s/localhost/${aws_db_instance.db-server-1.endpoint}/" /var/www/html/phpMyAdmin/config.inc.php
  sudo rm -f /var/www/html/index.html
  sudo systemctl restart httpd



  EOF

}


resource "aws_key_pair" "container" {
  key_name = "container"
  public_key = file("container.pem.pub")
  
}



resource "aws_security_group" "jumpserver-sg" {
  name        = "jumpserver-sg"
  description = "jumpserver-sg"
  vpc_id      = aws_vpc.container_vpc.id

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


resource "aws_instance" "ubuntu-instance_zone1" {
  ami           = var.ec2-ubuntu_ami
  instance_type = var.ec2_inztance_type_t2
  subnet_id     = aws_subnet.public_subnet_1.id
  key_name = var.ec2_keyname
  availability_zone = var.zone-1
  vpc_security_group_ids = [ aws_security_group.jumpserver-sg.id ]



  user_data = <<-EOF
  #!/bin/bash
  ## Update the apt Package Index:
  sudo apt-get update

  ## Install Packages to Allow apt to Use a Repository Over HTTPS:
  sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release

  ## Add Docker’s Official GPG Key:
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  ## Set Up the Stable Repository:
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  ## Update the apt Package Index (again):
  sudo apt-get update

  ### Install the Latest Version of Docker CE and Containerd:
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io

  ### Verify that Docker CE Is Installed Correctly:
  sudo docker run hello-world



  EOF


  tags = {
    Name = "container"
  }

}


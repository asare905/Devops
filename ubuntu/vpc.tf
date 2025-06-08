resource "aws_vpc" "container_vpc" {
  cidr_block       = "172.20.0.0/20"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "multitier_vpc"
  }
}
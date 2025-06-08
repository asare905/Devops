resource "aws_internet_gateway" "container_igw" {
    vpc_id = aws_vpc.container_vpc.id
    tags = {
      Name = "container_igw"
    }
}
resource "aws_internet_gateway" "multitier_igw" {
    vpc_id = aws_vpc.multitier_vpc.id
    tags = {
      Name = "multitier_igw"
    }
}
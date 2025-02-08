resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform.id

  tags = {
    Name = "igw-terr"
  }
}
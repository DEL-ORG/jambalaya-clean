resource "aws_subnet" "my_public_subnet1" {
  vpc_id                  = aws_vpc.my_vpc_2.id
  cidr_block              = "10.0.0.0/24" # Example CIDR block for the first public subnet
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "my-public-subnet-1"
  }
}

resource "aws_subnet" "my_public_subnet2" {
  vpc_id                  = aws_vpc.my_vpc_2.id
  cidr_block              = "10.0.1.0/24" # Example CIDR block for the second public subnet
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "my-public-subnet-2"
  }
}

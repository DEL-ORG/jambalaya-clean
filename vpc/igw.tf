# Create an Internet Gateway for the VPC
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc_2.id

  tags = {
    Name = "my-internet-gateway"
  }
}

# Create a route table for the public subnets
resource "aws_route_table" "my_public_route_table" {
  vpc_id = aws_vpc.my_vpc_2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my-public-route-table"
  }
}

# Associate the first public subnet with the route table
resource "aws_route_table_association" "my_subnet1_to_route_table" {
  subnet_id      = aws_subnet.my_public_subnet1.id
  route_table_id = aws_route_table.my_public_route_table.id
}

# Associate the second public subnet with the route table
resource "aws_route_table_association" "my_subnet2_to_route_table" {
  subnet_id      = aws_subnet.my_public_subnet2.id
  route_table_id = aws_route_table.my_public_route_table.id
}

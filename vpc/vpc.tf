resource "aws_vpc" "my_vpc_2" {
  cidr_block           = "10.0.0.0/16" # You can adjust the CIDR block as needed
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc_2"
  }
}

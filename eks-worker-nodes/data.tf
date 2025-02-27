# Retrieve the existing VPC information 
data "aws_vpc" "new-vpc" {
  id = "vpc-097381d7f22d49f22"
}

# Retrieve specific public subnets in the VPC
data "aws_subnet" "PublicSubnet1" {
  id = "subnet-0e0991673280d98ad"
}

data "aws_subnet" "PublicSubnet2" {
  id = "subnet-01b78dd16d6cad1bd"
}



# # Retrieve the existing VPC information
# data "aws_vpc" "new-vpc" {
#   id = var.vpc_id # Use the VPC ID provided in variables
# }

# # Retrieve all public subnets in the VPC from the list
# data "aws_subnet" "public_subnets" {
#   for_each = toset(var.public_subnet_ids) # Loop over the list of subnets
#   id       = each.value
# }

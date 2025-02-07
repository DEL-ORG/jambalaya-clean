# Retrieve the existing VPC information
data "aws_vpc" "my_vpc" {
  id = var.vpc_id  # Use the VPC ID provided in variables
}

# Retrieve all public subnets in the VPC from the list
data "aws_subnet" "public_subnets" {
  for_each = toset(var.public_subnet_ids)  # Loop over the list of subnets
  id       = each.value
}

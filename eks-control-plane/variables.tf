variable "vpc_id" {
  description = "ID of the existing VPC"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "eks_cluster_role_name" {
  description = "IAM role name for the EKS cluster"
  type        = string
}

variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}
# Common tags for resources
variable "common_tags" {
  description = "Common tags to be applied to resources"
  type        = map(string)

}

variable "eks_cluster_role_name" {
  description = "IAM role name for the EKS cluster"
  type        = string
  default     = "eks_worker_role"
}
variable "vpc_id" {
  description = "ID of the existing VPC"
  type        = string
  default     = "new-vpc"
}
variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "jambalaya-eks-cluster"
}

variable "instance_types" {
  description = "List of instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "public_subnet_ids" {
  description = "List of subnet IDs where the EKS worker nodes will be deployed"
  type        = list(string)
  default     = ["PublicSubnet1", "PublicSubnet2"]
}

variable "ami_type" {
  description = "AMI type to use for the worker nodes"
  type        = string
  default     = "AL2_x86_64"
}

variable "disk_size" {
  description = "Disk size for the worker nodes"
  type        = number
  default     = 20
}

variable "key_pair" {
  description = "SSH key pair name to access worker nodes"
  type        = string
  default     = "terra-key"
}

variable "capacity_type" {
  description = "Capacity type for the worker nodes"
  type        = string
  default     = "ON_DEMAND"
}

variable "desired_size" {
  description = "Desired size for the worker node group"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum size for the worker node group"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum size for the worker node group"
  type        = number
  default     = 4
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    "Name"        = "eks-worker-node",
    "environment" = "dev",
    "owner"       = "katya",
    "project"     = "jambalaya",
    "created_by"  = "Terraform"
  }
}

data "aws_eks_cluster" "cluster" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.eks_cluster_name
}
# data.tf

# Get EKS Cluster information
data "aws_eks_cluster" "eks" {
  name = var.eks_cluster_name
}

# Authenticate to EKS Cluster
data "aws_eks_cluster_auth" "eks" {
  name = var.eks_cluster_name
}



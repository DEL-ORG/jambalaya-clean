variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
  default     = "dev-springboot-katya-eks-rosy"
}

variable "eks_cluster_region" {
  description = "AWS Region of the EKS Cluster"
  type        = string
  default     = "us-east-1"
}

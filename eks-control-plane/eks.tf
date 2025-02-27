resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    #subnet_ids = var.public_subnet_ids
    subnet_ids = ["subnet-01b78dd16d6cad1bd", "subnet-0e0991673280d98ad"]
  }

  tags = merge(var.common_tags,
    { Name = format("%s-%s-%s-eks-rosy", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )

  depends_on = [
    aws_iam_role.eks_cluster_role,
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_service_policy
  ]
}

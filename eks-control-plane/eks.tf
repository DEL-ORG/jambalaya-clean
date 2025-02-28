resource "aws_iam_role" "eks_service_role" {
  name = "eks-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_service_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_service_role.name
}

resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_service_role.arn

  vpc_config {
    subnet_ids = ["subnet-01b78dd16d6cad1bd", "subnet-0e0991673280d98ad"]
    endpoint_public_access = true
    endpoint_private_access = false
  }

  tags = merge(var.common_tags,
    { Name = format("%s-%s-%s-eks-rosy", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )

  depends_on = [
    aws_iam_role.eks_service_role,
    aws_iam_role_policy_attachment.eks_service_policy_attachment,
    aws_iam_role_policy_attachment.eks_worker_policy_attachment,
    aws_iam_role_policy_attachment.eks_cni_policy_attachment,
    aws_iam_role_policy_attachment.eks_registrar_policy_attachment,
    aws_iam_role_policy_attachment.eks_elb_policy_attachment
  ]
}






# resource "aws_eks_cluster" "eks" {
#   name     = var.cluster_name
#   role_arn = aws_iam_role.eks_worker_role.arn

#   vpc_config {
#     #subnet_ids = var.public_subnet_ids
#     subnet_ids = ["subnet-01b78dd16d6cad1bd", "subnet-0e0991673280d98ad"]
#   }
  
#   tags = merge(var.common_tags,
#     { Name = format("%s-%s-%s-eks-rosy", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
#   )


#   depends_on = [
#     aws_iam_role.eks_worker_role,
#     aws_iam_role_policy_attachment.eks_worker_policy_attachment,
#     aws_iam_role_policy_attachment.eks_cni_policy_attachment,
#     aws_iam_role_policy_attachment.eks_registrar_policy_attachment,
#     aws_iam_role_policy_attachment.eks_elb_policy_attachment
# ]

# }

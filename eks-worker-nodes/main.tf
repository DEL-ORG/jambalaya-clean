resource "aws_eks_node_group" "eks_worker_nodes" {
  cluster_name    = "dev-springboot-katya-eks-rosy"
  node_group_name = format("%s-%s-%s-nodegroup", var.common_tags["environment"], var.common_tags["owner"], var.common_tags["project"])
  node_role_arn   = aws_iam_role.eks_worker_role.arn
  version         = "1.31" # Or whatever version you're using
  subnet_ids      = ["subnet-01b78dd16d6cad1bd", "subnet-0e0991673280d98ad"]
  capacity_type   = var.capacity_type
  ami_type        = var.ami_type
  instance_types  = var.instance_types
  disk_size       = var.disk_size
  remote_access {
    ec2_ssh_key = var.key_pair
  }

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-nodegroup", var.common_tags["environment"], var.common_tags["owner"], var.common_tags["project"])
  })
}

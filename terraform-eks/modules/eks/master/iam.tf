resource "aws_iam_role" "eks_master_role" {
  name               = format("%s-eks-master-role", var.cluster_name)
  assume_role_policy = data.aws_iam_policy_document.eks_master_role.json
}

resource "aws_iam_role_policy_attachment" "eks_master_attach_role_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role       = aws_iam_role.eks_master_role.name
}
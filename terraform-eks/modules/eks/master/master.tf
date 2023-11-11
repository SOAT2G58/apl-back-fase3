resource "aws_eks_cluster" "eks_cluster" {
    name = var.cluster_name
    version = var.kube_version
    role_arn = aws_iam_role.eks_master_role.arn

    vpc_config {
        security_group_ids = [
            aws_security_group.cluster_master_sg.id
        ]

        subnet_ids = [ 
            var.public_subnet_1a.id, 
            var.public_subnet_1b.id
        ]
    }

    tags = {
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }
}
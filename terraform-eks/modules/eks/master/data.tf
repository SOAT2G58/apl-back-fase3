data "aws_iam_policy_document" "eks_master_role" {
    version = "2012-10-17"
    statement {
        actions = ["sts:AssumeRole"]
        principals {
            type = "Service"
            identifiers = ["eks.amazonaws.com"]
        }
    }
}
## ECR Repo
resource "aws_ecr_repository" "ecr_repo" {
  name = var.ecr_repo_name

  tags = "${merge(var.default_tags, map("Name",var.ecr_repo_name))}"
}


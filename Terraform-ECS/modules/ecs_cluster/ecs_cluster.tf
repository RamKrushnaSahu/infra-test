## ECS Cluster
 resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name

  tags = "${merge(var.default_tags, map("Name",var.ecs_cluster_name))}"
}
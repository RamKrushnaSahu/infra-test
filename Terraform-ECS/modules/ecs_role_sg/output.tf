output "role_arn" {
  value       = "${aws_iam_role.fargate_role.arn}"
  description = "The arn of the role."
}

output "sg_id" {
  value = "${aws_security_group.ecs_task_sg.id}"
}
## Tag variables
variable default_tags {
  type = map
}

## ECS Cluster & Repository
variable "ecs_cluster_name" {}
variable "ecr_repo_name1" {}

## ECS Task
variable "ecs_task_name1" {}
variable "network_mode" {}
variable "req_compatibility" {}
variable "cpu" {}
variable "memory" {}
variable "container_name" {}
variable "container_port" {}
variable "task1_env_name1" {}
variable "task1_env_value1" {}



## ECS Service
variable "ecs_service_name1" {}
variable "ecsfar_task_desired_count" {}
variable "launch_type" {}
variable "dc_type" {}
variable "trt_subnet_ids" {}
variable "enable_public_ip" {}

## Task Role & Security group
variable "fargate_role_name" {}
variable "ecs_task_sg_name" {}
variable "ecs_task_sg_description" {}
variable "vpc_id" {}
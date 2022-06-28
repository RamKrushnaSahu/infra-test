## ECS Task
variable "ecs_task_name" {}
variable "network_mode" {}
variable "req_compatibility" {}
variable "cpu" {}
variable "memory" {}
variable "ecs_role" {}
variable "policy" {}


## ECS Service
variable "ecs_service_name" {}
variable "cluster_id" {}
variable "ecsfar_task_desired_count" {}
variable "launch_type" {}
variable "dc_type" {}
variable "ecs_sg_id" {}
variable "subnet_ids" {}
variable "enable_public_ip" {}


## Tag variables
variable default_tags {
  type = map
}
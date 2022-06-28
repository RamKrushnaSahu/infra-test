## ECS Role & Policy
variable "fargate_role_name" {}
variable "ECSTaskExecutionRole_policy_arn" {}
variable "SecretsManagerReadWrite_policy_arn" {}
variable "EC2ContainerRegistryFullAccess_policy_arn" {}
variable "S3FullAccess_policy_arn" {}
variable "APIGatewayPushToCloudWatchLogs_policy_arn" {}
variable "ECS_FullAccess_policy_arn" {}
variable "SSMFullAccess_policy_arn" {}
variable "DynamoDBFullAccess_policy_arn" {}
variable "SQSFullAccess_policy_arn" {}

## Task Security group
variable "ecs_task_sg_name" {}
variable "ecs_task_sg_description" {}
variable "vpc_id" {}

## Tag variables
variable default_tags {
  type = map
}


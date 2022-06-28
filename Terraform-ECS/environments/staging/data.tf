## Data variables for ECS Container Definition for Task-1
data "template_file" "policy1" {
  template = "${file("scripts/service1.json")}"
  vars = {
    container_name			= "${var.container_name}"
	  ecr_repo_name			= "${var.ecr_repo_name1}"
	  cpu					= "${var.cpu}"
	  memory				= "${var.memory}"
	  container_port		= "${var.container_port}"
	  env_name1				= "${var.task1_env_name1}"
	  env_value1			= "${var.task1_env_value1}"
  }
}


## Data Block for fetching AWS Managed policies

data "aws_iam_policy" "secretmanagerfullaccess_policy" {
  arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

data "aws_iam_policy" "amazonssmfullaccess_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

data "aws_iam_policy" "ECSTaskExecutionRole_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy" "EC2ContainerRegistryFullAccess_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

data "aws_iam_policy" "APIGatewayPushToCloudWatchLogs_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"
}

data "aws_iam_policy" "ECS_FullAccess_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

data "aws_iam_policy" "DynamoDBFullAccess_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

data "aws_iam_policy" "SQSFullAccess_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

data "aws_iam_policy" "amazons3fullaccess_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
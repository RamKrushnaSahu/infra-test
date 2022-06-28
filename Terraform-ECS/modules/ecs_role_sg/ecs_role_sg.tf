## ECS Fargate Role 

resource "aws_iam_role" "fargate_role" {
  name = var.fargate_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "ecsfarexecutionrole",
      "Resource": "*"
    }
  ]
}
EOF

tags = "${merge(var.default_tags, map("Name",var.fargate_role_name))}"
}

## ECS Fargate Role Policy Attachment

resource "aws_iam_role_policy_attachment" "fargate_policy_attach1" {
  role          = aws_iam_role.fargate_role.name
  policy_arn    = var.ECSTaskExecutionRole_policy_arn 
}

resource "aws_iam_role_policy_attachment" "fargate_policy_attach2" {
  role          = aws_iam_role.fargate_role.name
  policy_arn    = var.SecretsManagerReadWrite_policy_arn
}

resource "aws_iam_role_policy_attachment" "fargate_policy_attach3" {
  role          = aws_iam_role.fargate_role.name
  policy_arn    = var.EC2ContainerRegistryFullAccess_policy_arn  
}

resource "aws_iam_role_policy_attachment" "fargate_policy_attach4" {
  role          = aws_iam_role.fargate_role.name
  policy_arn    = var.S3FullAccess_policy_arn  
}

resource "aws_iam_role_policy_attachment" "fargate_policy_attach5" {
  role          = aws_iam_role.fargate_role.name
  policy_arn    = var.APIGatewayPushToCloudWatchLogs_policy_arn  
}

resource "aws_iam_role_policy_attachment" "fargate_policy_attach6" {
  role          = aws_iam_role.fargate_role.name
  policy_arn    = var.ECS_FullAccess_policy_arn  
}

resource "aws_iam_role_policy_attachment" "fargate_policy_attach7" {
  role          = aws_iam_role.fargate_role.name
  policy_arn    = var.SSMFullAccess_policy_arn  
}

resource "aws_iam_role_policy_attachment" "fargate_policy_attach8" {
  role          = aws_iam_role.fargate_role.name
  policy_arn    = var.DynamoDBFullAccess_policy_arn  
}

resource "aws_iam_role_policy_attachment" "fargate_policy_attach9" {
  role          = aws_iam_role.fargate_role.name
  policy_arn    = var.SQSFullAccess_policy_arn  
}


## ECS Task Security Group

resource "aws_security_group" "ecs_task_sg" {
  name          = var.ecs_task_sg_name 
  description   = var.ecs_task_sg_description 
  vpc_id        = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = "${merge(var.default_tags, map("Name",var.ecs_task_sg_name))}"
}



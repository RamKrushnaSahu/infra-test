## ECS Cluster
module "ecs_cluster"{
	source		  		= "../../modules/ecs_cluster"
	ecs_cluster_name	= var.ecs_cluster_name
	default_tags		= var.default_tags
}

## ECR Repository
module "ecr_repo_distributor"{
	source		  		= "../../modules/ecr_repo"
	ecr_repo_name		= var.ecr_repo_name1
	default_tags		= var.default_tags
}


## ECS Service-1 & Task-1 Defined

module "ecs_fargate1"{
	source		  					= "../../modules/ecs_fargate"
	ecs_task_name					= var.ecs_task_name1
	network_mode					= var.network_mode
	req_compatibility				= var.req_compatibility
	cpu								= var.cpu
	memory							= var.memory
	ecs_role						= module.ecs_role_sg.role_arn
	policy             				= data.template_file.policy1.rendered

	ecs_service_name				= var.ecs_service_name1
	cluster_id						= module.ecs_cluster.cluster_id
	ecsfar_task_desired_count		= var.ecsfar_task_desired_count
	launch_type						= var.launch_type
	dc_type							= var.dc_type
	ecs_sg_id						= "sg-0068c402cfa6be555"
	subnet_ids         				= var.trt_subnet_ids
	enable_public_ip			 	= var.enable_public_ip
	default_tags					= var.default_tags
}


## ECS Role & Security Group

module "ecs_role_sg"{
	source		  								              = "../../modules/ecs_role_sg"
	fargate_role_name							            = var.fargate_role_name
	ECSTaskExecutionRole_policy_arn				    = data.aws_iam_policy.ECSTaskExecutionRole_policy.arn
	SecretsManagerReadWrite_policy_arn			  = data.aws_iam_policy.secretmanagerfullaccess_policy.arn
	EC2ContainerRegistryFullAccess_policy_arn	= data.aws_iam_policy.EC2ContainerRegistryFullAccess_policy.arn
	S3FullAccess_policy_arn						        = data.aws_iam_policy.amazons3fullaccess_policy.arn
	APIGatewayPushToCloudWatchLogs_policy_arn	= data.aws_iam_policy.APIGatewayPushToCloudWatchLogs_policy.arn
	ECS_FullAccess_policy_arn					        = data.aws_iam_policy.ECS_FullAccess_policy.arn
	SSMFullAccess_policy_arn					        = data.aws_iam_policy.amazonssmfullaccess_policy.arn
	DynamoDBFullAccess_policy_arn				      = data.aws_iam_policy.DynamoDBFullAccess_policy.arn
	SQSFullAccess_policy_arn					        = data.aws_iam_policy.SQSFullAccess_policy.arn
	ecs_task_sg_name							            = var.ecs_task_sg_name
	ecs_task_sg_description						        = var.ecs_task_sg_description
	vpc_id										                = var.vpc_id
	default_tags								              = var.default_tags
}
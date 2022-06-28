## ECS Cluster & Repository
ecs_cluster_name	= "ECS-Cluster-Test"
ecr_repo_name1		= "springbootrepo"


## ECS Task Role & Security group
fargate_role_name			= "Fargate-Role-Test"
ecs_task_sg_name			= "SG-for-Fargate"
ecs_task_sg_description		= "Security group for ECS Fargate Tasks"
vpc_id						= "vpc-0bf944519ed196f8d"


## ECS Task
ecs_task_name1				= "ECS-Task-Test"
network_mode				= "awsvpc"
req_compatibility			= ["FARGATE"]
cpu							= "1024"
memory						= "2048"
container_name				= "Container-Test"
container_port				= "8080"

## ECS Task-1 environment variables
task1_env_name1				= "Env"
task1_env_value1			= "Test"


## ECS Service
ecs_service_name1			= "ECS-Service-Test"
ecsfar_task_desired_count	= "1"
launch_type					= "FARGATE"
dc_type						= "ECS"
trt_subnet_ids				= ["subnet-021bb9a30a7a85379"]
enable_public_ip 			= "false"


## Default tags

default_tags = {
	ApplicationName 		= "Springboot-App"
	Environment 			= "TEST"
	Automation 				= "Yes"
}

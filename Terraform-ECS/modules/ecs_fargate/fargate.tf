## ECS Task

resource "aws_ecs_task_definition" "taskdefinition" {
  #depends_on                    = [aws_cloudwatch_log_group.ecs_cloudwatch_log_group]
  family                        = var.ecs_task_name 
  network_mode                  = var.network_mode 
  requires_compatibilities      = var.req_compatibility 
  cpu                           = var.cpu
  memory                        = var.memory
  execution_role_arn            = var.ecs_role 
  task_role_arn                 = var.ecs_role 

  container_definitions = "${var.policy}"

  lifecycle {
    ignore_changes = [
      container_definitions
    ]
  }
  tags = "${merge(var.default_tags, map("Name",var.ecs_task_name))}"
}


## ECS Service

resource "aws_ecs_service" "ecs_service" {
  name                = var.ecs_service_name
  cluster             = var.cluster_id
  task_definition     = aws_ecs_task_definition.taskdefinition.arn
  desired_count       = var.ecsfar_task_desired_count
  launch_type         = var.launch_type 
  tags = "${merge(var.default_tags, map("Name",var.ecs_service_name))}"
  
  deployment_controller {
    type = "${var.dc_type}"
  }

  network_configuration {
    security_groups = [var.ecs_sg_id]
    subnets = "${var.subnet_ids}"
    assign_public_ip = "${var.enable_public_ip}" 
  }

lifecycle {
    ignore_changes = [
      task_definition,deployment_minimum_healthy_percent,desired_count
    ]
  }
}



resource "aws_ecs_service" "this" {
  name                 = "ecs-service"
  cluster              = aws_ecs_cluster.this.id
  task_definition      = aws_ecs_task_definition.portal.arn
  desired_count        = 1
  force_new_deployment = true

  network_configuration {
    subnets          = module.vpc.private_subnets
    assign_public_ip = false
    security_groups  = [aws_security_group.ecs_service.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.portal.arn
    container_name   = "portal"
    container_port   = 80
  }

  lifecycle {
    ignore_changes = [
      capacity_provider_strategy,
    ]
  }
}
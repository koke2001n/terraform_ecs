### ECS Task Definition
resource "aws_ecs_task_definition" "nginx" {
  family                   = "nginx"
  container_definitions    = file("./container_definitions.json")
  cpu                      = 256
  memory                   = 512
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  tags = {
    "Name" = "terraform"
  }
}
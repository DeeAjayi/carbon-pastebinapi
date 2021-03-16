resource "aws_ecr_repository" "pastebin" {
    name  = "pastebin"
}

resource "aws_ecs_cluster" "ecs_cluster" {
    name  = "pastebin-cluster"
}

resource "aws_ecs_task_definition" "task_definition" {
  family                = "pastebin"
  container_definitions = file("task_definition.json")
}

resource "aws_ecs_service" "pastebin" {
  name            = "pastebin"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 1
}
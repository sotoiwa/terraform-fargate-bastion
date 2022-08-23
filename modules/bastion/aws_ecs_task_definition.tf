resource "aws_ecs_task_definition" "this" {
  family             = "${var.app_name}-taskdef"
  cpu                = "256"
  memory             = "512"
  execution_role_arn = aws_iam_role.ecs_task_execution.arn
  task_role_arn      = aws_iam_role.ecs_task.arn

  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  container_definitions = <<EOF
[
  {
    "name"                  : "bastion",
    "image"                 : "${data.aws_caller_identity.this.account_id}.dkr.ecr.${data.aws_region.this.name}.amazonaws.com/bastion",
    "essential"             : true,
    "logConfiguration"      : {
      "logDriver" : "awslogs",
      "options"   : {
        "awslogs-group"         : "${var.app_name}",
        "awslogs-region"        : "${data.aws_region.this.name}",
        "awslogs-stream-prefix" : "bastion"
      }
    }
  }
]
EOF

}

resource "aws_ecs_task_definition" "debug" {
  family             = "debug"
  cpu                = "256"
  memory             = "512"
  execution_role_arn = aws_iam_role.ecs_task_execution.arn
  task_role_arn      = aws_iam_role.ecs_task.arn

  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  container_definitions = <<EOF
[
  {
    "name"                  : "debug",
    "image"                 : "${data.aws_caller_identity.this.account_id}.dkr.ecr.${data.aws_region.this.name}.amazonaws.com/debug",
    "essential"             : true,
    "logConfiguration"      : {
      "logDriver" : "awslogs",
      "options"   : {
        "awslogs-group"         : "${var.app_name}",
        "awslogs-region"        : "${data.aws_region.this.name}",
        "awslogs-stream-prefix" : "debug"
      }
    }
  }
]
EOF

}

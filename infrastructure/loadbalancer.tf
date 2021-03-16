resource "aws_lb" "pastebin_lb" {
  name               = "pastebin-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ecs_sg.id]
  subnets            = aws_subnet.pub_subnet[*].id

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "pastebin_tg" {
  name = "pastebin-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc.id
  target_type = "instance"
}



resource "aws_lb_listener" "pastebin_lb_lst" {
  load_balancer_arn  = aws_lb.pastebin_lb.arn
  port               = 80
  protocol           = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pastebin_tg.arn
  }
}

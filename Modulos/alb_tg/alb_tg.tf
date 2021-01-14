resource "aws_lb_target_group" "tg_qa" {
  name     = "TargetGroup-for-QA-and-HTTP"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.Vpc_id_alb_input

  tags = {
    "Name" = "TG_QA"
  }

}

resource "aws_lb_target_group_attachment" "TG_Atacchment_1" {
  target_group_arn = var.alb_arn
  target_id = var.server_1
  port      = 80
}

resource "aws_lb_target_group_attachment" "TG_Atacchment_2" {
  target_group_arn = var.alb_arn
  target_id = var.server_2
  port      = 80
}


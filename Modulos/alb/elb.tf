resource "aws_lb" "qaelb" {
  name               = "qaelb"
  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  subnets = [var.Public_Subnet_A, var.Public_Subnet_B]
  security_groups = [var.elb_Security_group]
  load_balancer_type = "application"

#   listener {
#     instance_port     = 80
#     instance_protocol = "http"
#     lb_port           = 80
#     lb_protocol       = "http"
#   }

#   health_check {
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout            = 3
#     target             = "HTTP:80/"
#     interval           = 10
#   }

#   instances                   = [var.Server_1, var.Server_2]
#   cross_zone_load_balancing   = true
#   idle_timeout                = 400
#   connection_draining         = true
#   connection_draining_timeout = 400

#   tags = {
#     "Name"     = "qaelb"
#     "Ambiente" = "QA"
#   }
# }
}

resource "aws_lb_listener" "Front_end" {
  load_balancer_arn = var.alb_arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = var.alb_tg_arn
            
  }
  
}
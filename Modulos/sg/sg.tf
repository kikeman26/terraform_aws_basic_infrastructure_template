resource "aws_security_group" "SG_ssh_http" {
    name = "SG-ssh-http"
    vpc_id = var.Vpc_id_sg_input

    ingress {
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        # cidr_blocks = ["0.0.0.0/0"]
        security_groups = [var.SG_elb_http_input]
        description = "HTTP"

    }

    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        # cidr_blocks = ["0.0.0.0/0"]
        security_groups = [var.SG_elb_http_input]
        description = "HTTPS"

    }

    # ingress {
    #     from_port = "22"
    #     to_port = "22"
    #     protocol = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"] #Modificar con IP de Casa Hiram
    #     description = "Casa Hiram"

    # }

    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
  
}

resource "aws_security_group" "SG_elb_http" {
    name = "SG_elb_http"
    description = "Allow HTTP"
    vpc_id = var.Vpc_id_sg_input

    ingress {
      cidr_blocks = ["0.0.0.0/0"]
      from_port = 80
      protocol = "tcp"
      to_port = 80
    }

    ingress {
      cidr_blocks = ["0.0.0.0/0"]
      from_port = 443
      protocol = "tcp"
      to_port = 443
    }

    egress {
      cidr_blocks = ["0.0.0.0/0"] 
      from_port = 0
      protocol = "-1"
      to_port = 0
    }

    tags = {
      "Name" = "qaelb"
      "Ambiente" = "QA"
    }
  
}

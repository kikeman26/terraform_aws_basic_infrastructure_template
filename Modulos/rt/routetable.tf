resource "aws_route_table" "Public_Route" {
    vpc_id = var.Vpc_id_rt_input

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.ig_input
    }

    tags = {
      "Name" = "Public_Route"
    }
  
}

resource "aws_route_table" "Private_Route" {
    vpc_id = var.Vpc_id_rt_input

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = var.natgw_input
    }
    

    tags = {
      "Name" = "Private_Route"
      
    }
  
}
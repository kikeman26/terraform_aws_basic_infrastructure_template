resource "aws_route_table_association" "Public_Association_A" {
    subnet_id = var.Public_Subnet_id_input_A
    route_table_id = var.Public_rt_input
  
}

resource "aws_route_table_association" "Public_Association_B" {
    subnet_id = var.Public_Subnet_id_input_B
    route_table_id = var.Public_rt_input
  
}

resource "aws_route_table_association" "Private_Association_A" {
    subnet_id = var.Private_Subnet_id_input_A
    route_table_id = var.Private_rt_input
  
}

resource "aws_route_table_association" "Private_Association_B" {
    subnet_id = var.Private_Subnet_id_input_B
    route_table_id = var.Private_rt_input
  
}
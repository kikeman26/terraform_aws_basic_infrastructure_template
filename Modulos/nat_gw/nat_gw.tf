resource "aws_nat_gateway" "nat_gw_qa" {
  allocation_id = var.eip_one_allocation_id
  subnet_id     = var.public_subnet_id
  #vpc_id = var.Vpc_id_nat_gw_input
}
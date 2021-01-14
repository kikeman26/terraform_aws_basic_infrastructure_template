# resource "aws_eip_association" "eip_server1" {
#     instance_id = var.server_1
#     allocation_id = var.association_1
  
# }

# resource "aws_eip_association" "eip_server2" {
#     instance_id = var.server_2
#     allocation_id = var.association_2
  
# }

resource "aws_eip_association" "nat_gw_qa" {
    network_interface_id = var.nat_gw_qa
    allocation_id = var.nat_gw_association
  
}

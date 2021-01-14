# output "aws_nat_gateway_output" {
#   value = aws_nat_gateway.nat_gw_qa.id
# }

output "aws_nat_gateway_id_output" {
  value = aws_nat_gateway.nat_gw_qa.id
  
}

output "aws_nat_gateway_eni_output" {
  value = aws_nat_gateway.nat_gw_qa.network_interface_id
  
}

output "aws_nat_gateway_allocation_output" {
  value = aws_nat_gateway.nat_gw_qa.allocation_id
  
}
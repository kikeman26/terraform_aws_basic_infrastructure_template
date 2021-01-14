output "public_rt_output" {
    value = aws_route_table.Public_Route.id
  
}

output "private_rt_output" {
    value = aws_route_table.Private_Route.id
  
}
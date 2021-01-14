output "SG_ssh_http_output" {
    value = aws_security_group.SG_ssh_http.id
  
}

output "SG_elb_http" {
  value = aws_security_group.SG_elb_http.id
}
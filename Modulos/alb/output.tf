output "alb_id" {
  value = aws_lb.qaelb.id
}

output "alb_arn" {
  value = aws_lb.qaelb.arn
}

output "alb_dns" {
  value = aws_lb.qaelb.dns_name
  
}
resource "aws_route53_zone" "QA_Zone" {
    name = "qa.hiramidianelli.com"
    force_destroy = true

    vpc {
      vpc_id = var.Vpc_id_r53_input
    }
  
}

# resource "aws_route53_record" "server1" {
#   zone_id = aws_route53_zone.QA_Zone.zone_id
#   name    = "server1.qa.infrastructure.com"
#   type    = "A"
#   ttl     = "300"
#   records = [aws_instance.server1.private_ip]

# }

# resource "aws_route53_record" "server2" {
#   zone_id = aws_route53_zone.QA_Zone.zone_id
#   name    = "server2.qa.infrastructure.com"
#   type    = "A"
#   ttl     = "300"
#   records = [aws_instance.server2.private_ip]

# }

resource "aws_route53_record" "myelb" {
  zone_id = aws_route53_zone.QA_Zone.zone_id
  name = "applb.qa.hiramidianelli.com"
  type = "CNAME"
  ttl =  "300"
  records = [var.alb_dns]
  
}
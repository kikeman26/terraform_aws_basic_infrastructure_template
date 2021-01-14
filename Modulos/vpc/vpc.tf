resource "aws_vpc" "kikeman_vpc" {
    cidr_block = var.kikeman_vpc_cidr
    instance_tenancy = var.vpc_tenancy
    enable_dns_hostnames = true

    tags = {
      "Name" = "kikeman_vpc"
    }
  
}
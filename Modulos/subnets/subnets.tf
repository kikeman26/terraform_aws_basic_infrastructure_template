resource "aws_subnet" "Public_Subnet_A" {
    vpc_id = var.Vpc_id_subnet_input
    cidr_block = var.Subnet_Cidr_PA
    availability_zone = "us-east-2a"

    tags = {
      "Name" = "Public_Subnet_A"
      "Ambiente" = "QA"
    }
  
}

resource "aws_subnet" "Public_Subnet_B" {
    vpc_id = var.Vpc_id_subnet_input
    cidr_block = var.Subnet_Cidr_PB
    availability_zone = "us-east-2b"

    tags = {
      "Name" = "Public_Subnet_B"
      "Ambiente" = "QA"
    }
  
}

resource "aws_subnet" "Private_Subnet_A" {
    vpc_id = var.Vpc_id_subnet_input
    cidr_block = var.Subnet_Cidr_PrA
    availability_zone = "us-east-2a"

    tags = {
      "Name" = "Private_Subnet_A"
      "Ambiente" = "QA"
    }
  
}

resource "aws_subnet" "Private_Subnet_B" {
    vpc_id = var.Vpc_id_subnet_input
    cidr_block = var.Subnet_Cidr_PrB
    availability_zone = "us-east-2b"

    tags = {
      "Name" = "Private_Subnet_B"
      "Ambiente" = "QA"
    }
  
}
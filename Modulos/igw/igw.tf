resource "aws_internet_gateway" "Kikeman_IGW" {
    vpc_id = var.Vpc_id_igw_input

    tags = {
      "Name" = "Kikeman_IGW"
    }
  
}
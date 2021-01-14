resource "aws_instance" "server1" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_groups
    subnet_id = var.private_subnet_a
    associate_public_ip_address = true
    #private_ip = "192.168.50.10"
    key_name = var.key_pair
    user_data = var.userdata_1

    tags = {
      "Name" = "Server1"
      "Ambiente" = "QA"
    }
  
}

resource "aws_instance" "server2" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_groups
    subnet_id = var.private_subnet_b
    associate_public_ip_address = true
    #private_ip = "192.168.50.10"
    key_name = var.key_pair
    user_data = var.userdata_2

    tags = {
      "Name" = "Server2"
      "Ambiente" = "QA"
    }
  
}
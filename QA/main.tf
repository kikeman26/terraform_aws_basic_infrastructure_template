# terraform {
#     backend "s3" {
#         bucket = "tf-test-infra-kikeman"
#         key = "global/qa/s3/terraform.tfstate"
#         region = "us-east-2"
#     }
# }

# module "aws_S3_backend" {
#   source = "./Backend"
  
# }

module "VPC" {
  source           = "../Modulos/vpc"
  kikeman_vpc_cidr = "192.168.30.0/24"
  vpc_tenancy      = "default"
  kikeman_vpc_id   = module.VPC.vpc_id_output

}

module "Subnets" {
  source              = "../Modulos/subnets"
  Subnet_Cidr_PA      = "192.168.30.0/28"
  Subnet_Cidr_PB      = "192.168.30.16/28"
  Subnet_Cidr_PrA     = "192.168.30.32/28"
  Subnet_Cidr_PrB     = "192.168.30.48/28"
  Vpc_id_subnet_input = module.VPC.vpc_id_output

}

module "Internet_Gateway" {
  source           = "../Modulos/igw"
  Vpc_id_igw_input = module.VPC.vpc_id_output

}

module "NAT_GW" {
  source                = "../Modulos/nat_gw"
  Vpc_id_nat_gw_input = module.VPC.vpc_id_output
  eip_one_allocation_id = module.EIP.eip_one_id_output
  public_subnet_id      = module.Subnets.Subnet_id_Public_A_output
  
}

module "Route_Tables" {
  source          = "../Modulos/rt"
  Vpc_id_rt_input = module.VPC.vpc_id_output
  ig_input        = module.Internet_Gateway.Vpc_id_igw_output
  natgw_input     = module.NAT_GW.aws_nat_gateway_id_output

}

module "EIP" {
  source = "../Modulos/EIP"

}

module "eip_assoc" {
  source = "../Modulos/eip_assoc"
  nat_gw_qa = module.NAT_GW.aws_nat_gateway_eni_output
  nat_gw_association = module.EIP.eip_one_id_output
}

module "Route_Table_Association" {
  source                    = "../Modulos/rt-assoc"
  Public_Subnet_id_input_A  = module.Subnets.Subnet_id_Public_A_output
  Public_Subnet_id_input_B  = module.Subnets.Subnet_id_Public_B_output
  Public_rt_input           = module.Route_Tables.public_rt_output
  Private_Subnet_id_input_A = module.Subnets.Subnet_id_Private_A_output
  Private_Subnet_id_input_B = module.Subnets.Subnet_id_Private_B_output
  Private_rt_input          = module.Route_Tables.private_rt_output

}

module "Security_Groups" {
  source            = "../Modulos/sg"
  Vpc_id_sg_input   = module.VPC.vpc_id_output
  SG_elb_http_input = module.Security_Groups.SG_elb_http

}

module "Route53" {
  source           = "../Modulos/route53"
  Vpc_id_r53_input = module.VPC.vpc_id_output
  alb_dns = module.ALB.alb_dns

}

module "Key_pair" {
  source  = "../Modulos/Key_pair"
  ssh_key = file("C:/Users/hiram.rosales/Documents/TF_Infrastructure/Modulos/key_pair/tf_key.pub")

}


module "EC2" {
  source          = "../Modulos/ec2"
  ami             = "ami-0a0ad6b70e61be944"
  instance_type   = "t2.micro"
  security_groups = [module.Security_Groups.SG_ssh_http_output]
  #public_subnet_a = module.Subnets.Subnet_id_Public_A_output
  private_subnet_a = module.Subnets.Subnet_id_Private_A_output
  private_subnet_b = module.Subnets.Subnet_id_Private_B_output
  key_pair         = module.Key_pair.ssh_key_output
  userdata_1       = file("C:/Users/hiram.rosales/Documents/TF_Infrastructure/Modulos/ec2/userdata_1.sh")
  userdata_2       = file("C:/Users/hiram.rosales/Documents/TF_Infrastructure/Modulos/ec2/userdata_2.sh")

}

module "ALB" {
  source          = "../Modulos/alb"
  Public_Subnet_A = module.Subnets.Subnet_id_Public_A_output
  Public_Subnet_B = module.Subnets.Subnet_id_Public_B_output
  # Server_1 = module.EC2.server_1_output
  # Server_2 = module.EC2.server_2_output
  elb_Security_group = module.Security_Groups.SG_elb_http
  alb_arn            = module.ALB.alb_arn
  alb_tg_arn         = module.TG_Attachment.tg_alb_arn_output
}

module "TG_Attachment" {
  source           = "../Modulos/alb_tg"
  Vpc_id_alb_input = module.VPC.vpc_id_output
  alb_arn          = module.TG_Attachment.tg_alb_arn_output
  server_1         = module.EC2.server_1_output
  server_2         = module.EC2.server_2_output
  # target_instances = [module.EC2.server_1_output, module.EC2.server_2_output]
}




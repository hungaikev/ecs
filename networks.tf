### Networks

# Data
data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "Djuaji"
  cidr = var.cidr
  azs = "${slice(data.aws_availability_zones.available.names,0 , var.subnet_count)}"
  private_subnets = ["10.0.1.0/24", "10.0.3.0/24"]
  public_subnets = ["10.0.0.0/24", "10.0.2.0/24"]
  enable_nat_gateway = true
  create_database_subnet_group = false

  tags = {
    Terraform = "true"
    Envrionment = "dev"
  }

}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.2"

  name = "ecs-cluster"
  cidr = "10.0.0.0/24"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.0.128/26", "10.0.0.192/26"]
  public_subnets  = ["10.0.0.0/26", "10.0.0.64/26"]

  default_security_group_ingress = [
    { cidr_blocks = "0.0.0.0/0", from_port = 0, to_port = 0, protocol = "-1" }
  ]

  default_security_group_egress = [
    { cidr_blocks = "0.0.0.0/0", from_port = 0, to_port = 0, protocol = "-1" }
  ]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_vpn_gateway = false
}

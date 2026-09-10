module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.5.0.0/16"
  azs  = ["us-east-1e", "us-east-1f"]

  enable_dns_support   = true
  enable_dns_hostnames = true

}

resource "aws_subnet" "pb_sn" {
  vpc_id    		  = module.vpc.vpc_id
  cidr_block 		  = "10.5.5.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1f"
}

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "my_sg"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = {
    ssh = {
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}

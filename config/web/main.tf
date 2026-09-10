resource "aws_instance" "server" {
  ami             = "ami-0b6d9d3d33ba97d99"
  instance_type   = "t3.micro"
  subnet_id       = var.sn
  security_groups = [var.sg]
  tags = {
    Name = "myserver"
  }
}





module "security_group" {
  source = "terraform-aws-modules/security-group/aws"
  name        = "my_sg"
}

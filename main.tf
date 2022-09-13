module "vpc-ppt" {
  source  = "app.terraform.io/module_practice/vpc-ppt/aws"
  version = "1.0.1"
  # insert required variables here
  vpc_cidr = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  available_zone = var.available_zone
}

resource "aws_instance" "web" {
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id = module.vpc-ppt.subnet_id
  tags              = {
     "Name" = "web"
  }
  depends_on = [
    module.vpc-ppt
  ]
}

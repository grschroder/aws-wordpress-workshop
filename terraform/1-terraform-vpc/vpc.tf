resource "aws_vpc" "vpc-workshop" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_support   = true
  #enable_dns_hostnames = true
  
  tags = {
      Name = "vpc-workshop"
  }
}



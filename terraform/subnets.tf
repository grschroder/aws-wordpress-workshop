resource "aws_subnet" "bastion-subnet" {
  vpc_id                  = aws_vpc.vpc-workshop.id
  cidr_block              = "192.168.20.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true
  tags = {
      Name = "bastion-subnet"
  }
}

resource "aws_subnet" "public-subnet-alb-a" {
    vpc_id                  = aws_vpc.vpc-workshop.id
    cidr_block              = "192.168.10.0/24"
    availability_zone       = "sa-east-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "public-subnet-alb-a"
    }
}

resource "aws_subnet" "public-subnet-alb-b" {
    vpc_id                  = aws_vpc.vpc-workshop.id
    cidr_block              = "192.168.11.0/24"
    availability_zone       = "sa-east-1b"
    map_public_ip_on_launch = true
    tags = {
        Name = "public-subnet-alb-b"
    }
}

resource "aws_subnet" "priv-subnet-wp" {
    vpc_id                  = aws_vpc.vpc-workshop.id
    cidr_block              = "192.168.2.0/24"
    availability_zone       = "sa-east-1a"
    map_public_ip_on_launch = false
    tags = {
        Name = "priv-subnet-wp"
    }
}

resource "aws_subnet" "priv-subnet-rds-a" {
    vpc_id                  = aws_vpc.vpc-workshop.id
    cidr_block              = "192.168.3.0/24"
    availability_zone       = "sa-east-1a"
    map_public_ip_on_launch = false
    tags = {
        Name = "priv-subnet-rds-a"
    }
}

resource "aws_subnet" "priv-subnet-rds-b" {
    vpc_id                  = aws_vpc.vpc-workshop.id
    cidr_block              = "192.168.4.0/24"
    availability_zone       = "sa-east-1b"
    map_public_ip_on_launch = false
    tags = {
        Name = "priv-subnet-rds-b"
    }
}


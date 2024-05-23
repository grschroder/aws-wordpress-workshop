resource "aws_eip" "eip-nat-gw-vpc-workshop" {
        
    tags = {
        Name = "eip-nat-gw-vpc-workshop"
    }
}

resource "aws_nat_gateway" "nat-gw-vpc-workshop" {
  allocation_id = aws_eip.eip-nat-gw-vpc-workshop.id
  subnet_id     = aws_subnet.openvpn-subnet.id

  tags = {
      Name = "nat-gw-vpc-workshop"
  }
  
}

resource "aws_route_table" "rtable-priv-default-vpc-workshop" {
  vpc_id = aws_vpc.vpc-workshop.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw-vpc-workshop.id
  }

  tags = {
      Name = "rtable-priv-default-vpc-workshop"
  }
}

resource "aws_route_table" "rtable-priv-subnet-rds" {
  vpc_id = aws_vpc.vpc-workshop.id

  tags = {
    Name = "rtable-priv-subnet-rds-vpc-workshop"
  }
}

resource "aws_route_table_association" "rtable-assoc-priv-subnet-wp" {
  subnet_id      = aws_subnet.priv-subnet-wp.id
  route_table_id = aws_route_table.rtable-priv-default-vpc-workshop.id
}

resource "aws_route_table_association" "rtable-assoc-priv-subnet-rds-a" {
  subnet_id      = aws_subnet.priv-subnet-rds-a.id
  route_table_id = aws_route_table.rtable-priv-subnet-rds.id
}

resource "aws_route_table_association" "rtable-assoc-priv-subnet-rds-b" {
  subnet_id      = aws_subnet.priv-subnet-rds-b.id
  route_table_id = aws_route_table.rtable-priv-subnet-rds.id
}
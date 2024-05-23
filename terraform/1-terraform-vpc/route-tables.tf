resource "aws_route_table" "public-route-table-vpc-workshop" {
    vpc_id = aws_vpc.vpc-workshop.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw-vpc-workshop.id
    }
    tags = {
        Name = "public-route-table-vpc-workshop"
    }
}

resource "aws_route_table_association" "public-route-table-assoc-openvpn-subnet" {
    subnet_id      = aws_subnet.openvpn-subnet.id
    route_table_id = aws_route_table.public-route-table-vpc-workshop.id
}

resource "aws_route_table_association" "public-route-table-assoc-public-subnet-alb-a" {
    subnet_id      = aws_subnet.public-subnet-alb-a.id
    route_table_id = aws_route_table.public-route-table-vpc-workshop.id
}

resource "aws_route_table_association" "public-route-table-assoc-public-subnet-alb-b" {
    subnet_id      = aws_subnet.public-subnet-alb-b.id
    route_table_id = aws_route_table.public-route-table-vpc-workshop.id
}
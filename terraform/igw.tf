resource "aws_internet_gateway" "igw-vpc-workshop" {
    vpc_id = aws_vpc.vpc-workshop.id
    tags = {
        Name = "igw-vpc-workshop"
    }
}
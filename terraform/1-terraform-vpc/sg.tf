resource "aws_security_group" "allow_ssh" {
    name        = "allow_ssh"
    description = "Allow SSH inbound traffic"
    vpc_id      = aws_vpc.vpc-workshop.id
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
    }
}

resource "aws_security_group" "allow_https" {
    name        = "allow_https"
    description = "Allow HTTPS inbound traffic"
    vpc_id      = aws_vpc.vpc-workshop.id
    
    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    
    tags = {
        Name = "allow_https"
    }
}

resource "aws_security_group" "allow_http" {
    name        = "allow_http"
    description = "Allow HTTP inbound traffic"
    vpc_id      = aws_vpc.vpc-workshop.id
    
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_http"
    }
}

resource "aws_security_group" "allow_mysql" {
    name        = "allow_mysql"
    description = "Allow MySQL inbound traffic"
    vpc_id      = aws_vpc.vpc-workshop.id
    
    ingress {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        #cidr_blocks = ["192.168.2.0/24"]
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }


    tags = {
        Name = "allow_mysql"
    }
}

resource "aws_security_group" "allow_vpn" {
    name        = "allow_vpn"
    description = "Allow OpenVPN inbound traffic"
    vpc_id      = aws_vpc.vpc-workshop.id
    
    ingress {
        from_port   = 1194
        to_port     = 1194
        protocol    = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_vpn"
    }
}

resource "aws_security_group" "allow_icmp" {
  name        = "allow_icmp"
  description = "Allow ICMP inbound traffic"
  vpc_id      = aws_vpc.vpc-workshop.id

  ingress {
    description      = "Allow ICMP from ALL" 
    to_port          = 0
    from_port        = 8
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 8
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_icmp"
  }
}
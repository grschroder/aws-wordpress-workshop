output "vpc_id" {
    value = aws_vpc.vpc-workshop.id
}

output "allow_ssh_id" {
    value = aws_security_group.allow_ssh.id
}

output "allow_https_id" {
    value = aws_security_group.allow_https.id
}

output "allow_http_id" {
    value = aws_security_group.allow_http.id
}

output "allow_mysql_id" {
    value = aws_security_group.allow_mysql.id
}

output "allow_vpn_id" {
    value = aws_security_group.allow_vpn.id
}

output "openvpn_subnet_id" {
    value = aws_subnet.openvpn-subnet.id
}

output "public_subnet_alb_a_id" {
    value = aws_subnet.public-subnet-alb-a.id
}

output "public_subnet_alb_b_id" {
    value = aws_subnet.public-subnet-alb-b.id
}

output "priv_subnet_wp_id" {
    value = aws_subnet.priv-subnet-wp.id
}

output "priv_subnet_rds_a_id" {
    value = aws_subnet.priv-subnet-rds-a.id
}

output "priv_subnet_rds_b_id" {
    value = aws_subnet.priv-subnet-rds-b.id
}

output "alb_dns_name" {
    value = aws_lb.alb-wp.dns_name
}
output "rds_db_dns" {
    value = aws_db_instance.rds-mysql-wp-db.address
}
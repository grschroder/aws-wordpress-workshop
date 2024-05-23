resource "aws_instance" "bastion-host" {
  ami           = data.aws_ami.ami-ubuntu22-server.id
  instance_type = "t2.micro"
  key_name      = var.SSH_KEY_NAME
  subnet_id     = aws_subnet.openvpn-subnet.id

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_icmp.id
  ]

  tags = {
    Name = "bastion-host"
  }
  

}
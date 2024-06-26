resource "aws_instance" "bastion-host" {
  ami           = data.aws_ami.ami-ubuntu22-server.id
  instance_type = "t2.micro"
  key_name      = var.SSH_KEY_NAME
  subnet_id     = aws_subnet.bastion-subnet.id

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_icmp.id,
    aws_security_group.allow_http.id,
    aws_security_group.allow_https.id
  ]

  tags = {
    Name = "bastion-host"
  }
  

}
locals {
  RDS_DNS_NAME = aws_db_instance.rds-mysql-wp-db.address
  
}

resource "aws_launch_template" "launch-template-wp" {
  name_prefix   = "wp-asg-"
  image_id      = data.aws_ami.ami-ubuntu22-server.id
  instance_type = "t3.medium"
  key_name      = var.SSH_KEY_NAME
  #user_data     = filebase64("wp-userdata.yaml")
  user_data     = base64encode("${templatefile("wp-userdata.yaml", {
    RDS_DNS_NAME   = local.RDS_DNS_NAME    
  })}")

  vpc_security_group_ids = [
    aws_security_group.allow_https.id,
    aws_security_group.allow_http.id,
    aws_security_group.allow_ssh.id
  ]  

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "wp-instance"
    }
  }
  
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_placement_group" "spread-placement-group" {
  name     = "spread-placement-group"
  strategy = "spread"
}

resource "aws_autoscaling_group" "autoscaling-group-wp" {
  name                      = "wp-asg"
  placement_group           = aws_placement_group.spread-placement-group.name
  min_size                  = 1
  max_size                  = 4
  desired_capacity          = 1
  
  vpc_zone_identifier        = [
    aws_subnet.priv-subnet-wp.id
    #aws_subnet.openvpn-subnet.id
  ]

  launch_template {
    id = aws_launch_template.launch-template-wp.id
    version = "$Latest"    
  }

}

resource "aws_lb" "alb-wp" {
  name                       = "alb-wp"
  internal                   = false
  load_balancer_type         = "application"
  subnets                    = [
    aws_subnet.public-subnet-alb-a.id,
    aws_subnet.public-subnet-alb-b.id    
  ]
  security_groups            = [ 
    aws_security_group.allow_https.id,
    aws_security_group.allow_http.id
  ]
  enable_deletion_protection = false

  tags = {
    Name = "alb-wp"
  }

}

resource "aws_lb_target_group" "alb-wp-tg" {
  name        = "alb-wp-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc-workshop.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "80"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }

  tags = {
    Name = "alb-wp-tg"
  }
}

resource "aws_lb_listener" "alb-wp-listener" {
  load_balancer_arn = aws_lb.alb-wp.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-wp-tg.arn
  }

  tags = {
    Name = "alb-wp-listener"
  }
}

resource "aws_autoscaling_attachment" "alb-asg-app-attachment" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling-group-wp.name
  lb_target_group_arn    = aws_lb_target_group.alb-wp-tg.arn
}
resource "aws_launch_configuration" "aws_launch_configuration_production" {
  name_prefix         = "WEBServer-Highly-Available-LC-"
  instance_type       = var.instance_type
  image_id            = data.aws_ami.amzLinux.image_id
  security_groups     = [ aws_security_group.cluster_sg.id ]
  user_data           = file("./user_data/production.sh")
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg_web" {
  name                      = "ASG-${aws_launch_configuration.aws_launch_configuration_production.name}"
  launch_configuration      = aws_launch_configuration.aws_launch_configuration_production.id
  min_size                  = var.min_size
  max_size                  = var.max_size
  min_elb_capacity          = var.min_elb_capacity
  health_check_type         = var.health_check_type

  vpc_zone_identifier = [ 
    aws_default_subnet.default_1.id,
    aws_default_subnet.default_2.id 
  ]

  load_balancers = [ 
    aws_elb.production_web_elb.id 
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_elb" "production_web_elb" {
  name = "HA-production-ELB"
  availability_zones = [ 
    data.aws_availability_zones.working.names[0],
    data.aws_availability_zones.working.names[1]
  ]
  security_groups = [ 
    aws_security_group.cluster_sg.id 
  ]
  
  listener {
    lb_port            = var.lb_port
    lb_protocol        = var.lb_protocol
    instance_port      = var.instance_port 
    instance_protocol  = var.instance_protocol
  }

  health_check {
   healthy_threshold     = var.healthy_threshold
   unhealthy_threshold   = var.unhealthy_threshold
   timeout               = var.timeout
   target                = var.target
   interval              = var.interval
  }

  tags = {
    Name = "HA-production-ELB"
  }
}
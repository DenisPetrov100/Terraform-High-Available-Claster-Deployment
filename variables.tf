#################################################
# Main config
#################################################

variable "region" {
  description = "Please, enter AWS region to deploy app"
  default = "us-west-1"
}

variable "name_prefix" {
  default = "WEBServer-Highly-Available-LC-"
}

#################################################
# EC2 instance config
#################################################

variable "instance_type" {
  default = "t2.micro"
}

#################################################
# AutoScaling Group config
#################################################

variable "min_size" {
  default = 2
}
variable "max_size" {
  default = 2
}
variable "min_elb_capacity" {
  default = 2
}
variable "health_check_type" {
  default = "ELB"
}

#################################################
# Elastic Load Balancer config
#################################################

# Listener
variable "lb_port" {
  default = 80
}
variable "lb_protocol" {
  default = "http"
}
variable "instance_port" {
  default = 80
}
variable "instance_protocol" {
  default = "http"
}

# Health check
variable "healthy_threshold" {
  default = 2
}
variable "unhealthy_threshold" {
  default = 2
}
variable "timeout" {
  default = 3
}
variable "target" {
  default = "HTTP:80/"
}
variable "interval" {
  default = 10
}

#################################################
# Security Group config
#################################################

variable "allowed_ports" {
  default = ["80", "443", "22"]
}
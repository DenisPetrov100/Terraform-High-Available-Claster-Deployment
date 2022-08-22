data "aws_availability_zones" "working" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_vpcs" "all" {}
data "aws_instances" "production_app" {
  filter {
    name   = "tag:Name"
    values = ["production_terraform_app_server"]
  }
}
data "aws_ami" "amzLinux" {
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}
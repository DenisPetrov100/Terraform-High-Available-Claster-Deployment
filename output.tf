output "_0_aws_availability_zone" {
  value       = data.aws_availability_zones.working.names[0]
}

output "_1_aws_caller_identity" {
  value       = data.aws_caller_identity.current.id
}

output "_2_aws_region" {
  value       = data.aws_region.current.name
}

output "_3_instance_app_production_public_ip" {
  value       = "http://${aws_elb.production_web_elb.dns_name}"
}

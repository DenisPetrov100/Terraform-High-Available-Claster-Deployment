# Demo app AWS Terraform deploying
This repo shows how to deploy simple demo application (just html file) in "Highly Available" manier

## Features 
- Cluster of application on EC2 instances, 2 by default
- Autoscaling group
- Elastic Load Balancer
- Auto lookup of latest Amazon Linux 2 AMI

## Requirements
- AWS account with permissions and access_key/secret_key
- Latest Terraform installed
- Latest AWS CLI installed
- AWS CLI configured for working with AWS (set access_key/secret_key)

## Get started
- `terraform plan`
- `terraform apply`
- Find in outputs `_3_instance_app_production_public_ip` entry. It's value may be like this `http://HA-production-ELB-1438373499.us-west-1.elb.amazonaws.com`
- Open it in browser
- You will see `Version: 1.0.0` Demo App (can take some time at first deploy)
- Change `Version: 1.0.0` to `Version: 2.0.0` in `./user_data/production.sh` and save it
- `terraform apply`
- Go to browser and refrash the page for a minet or to, and you will see `Version: 2.0.0` Demo App and no any downtime between tow versions



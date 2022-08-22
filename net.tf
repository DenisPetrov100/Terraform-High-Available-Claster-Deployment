resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "default_1" {
  availability_zone = data.aws_availability_zones.working.names[0]
  tags = {
    Name = "Default SubNet"
  }
}

resource "aws_default_subnet" "default_2" {
  availability_zone = data.aws_availability_zones.working.names[1]
  tags = {
    Name = "Default SubNet"
  }
}

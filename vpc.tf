##############################
#   Application VPC          #
##############################

# Define our VPC
resource "aws_vpc" "Application-VPC" {
  cidr_block = "${var.app_vpc_cidr}"
  enable_dns_hostnames = true

  tags = {
    Name = "Stellar-Tests-VPC"
  }
}

# Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.Application-VPC.id}"

  tags = {
    Name = "App-VPC-IGW"
  }
}

# Define the public route table
resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.Application-VPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "Fed-Public-RT"
  }
}

resource "aws_main_route_table_association" "public-main-rt" {
  vpc_id         = "${aws_vpc.Application-VPC.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}


resource "aws_route53_zone" "private" {
  name = "kin.test"

  vpc {
    vpc_id = "${aws_vpc.Application-VPC.id}"
  }
}

#resource "aws_route53_zone_association" "secondary" {
#  zone_id = "${aws_route53_zone.private.zone_id}"
#  vpc_id  = "${aws_vpc.Application-VPC.id}"
#}


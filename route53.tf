resource "aws_route53_zone" "primary" {
  name = "kin.perftest"

  vpc {
    vpc_id = "${aws_vpc.Application-VPC.id}"
  }
}

#resource "aws_route53_zone_association" "secondary" {
#  zone_id = "${aws_route53_zone.private.zone_id}"
#  vpc_id  = "${aws_vpc.Application-VPC.id}"
#

resource "aws_route53_record" "test-core-1" {
  zone_id = "${aws_route53_zone.primary.zone_id}"
  name    = "test-core-1"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.test-core-1.private_ip}"]
}

resource "aws_route53_record" "test-core-2" {
  zone_id = "${aws_route53_zone.primary.zone_id}"
  name    = "test-core-2"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.test-core-2.private_ip}"]
}

resource "aws_route53_record" "test-core-3" {
  zone_id = "${aws_route53_zone.primary.zone_id}"
  name    = "test-core-3"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.test-core-3.private_ip}"]
}

resource "aws_route53_record" "test-core-4" {
  zone_id = "${aws_route53_zone.primary.zone_id}"
  name    = "test-core-4"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.test-core-4.private_ip}"]
}

resource "aws_route53_record" "test-core-5" {
  zone_id = "${aws_route53_zone.primary.zone_id}"
  name    = "test-core-5"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.test-core-5.private_ip}"]
}

##################
# EC2 Instances ##
##################
# Define stellar inside the private subnet

resource "aws_instance" "test-core-1" {
   ami = "ami-0f0640cb26740d676"
   instance_type = "t3.medium"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.stellar-sg.id}"]
   associate_public_ip_address = false
   source_dest_check = false
   #iam_instance_profile = "${aws_iam_instance_profile.stellar_profile.name}"
root_block_device {
    volume_size = "8"
    volume_type = "standard"
  }

  tags = {
    Name = "test-core-1"
  }
}


resource "aws_instance" "test-core-2" {
   ami = "ami-0329dc5c2d5aaac82"
   instance_type = "t3.medium"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.stellar-sg.id}"]
   associate_public_ip_address = false
   source_dest_check = false
   #iam_instance_profile = "${aws_iam_instance_profile.stellar_profile.name}"
root_block_device {
    volume_size = "8"
    volume_type = "standard"
  }

  tags = {
    Name = "test-core-2"
  }
}

resource "aws_instance" "test-core-3" {
   ami = "ami-05641141dae12d64c"
   instance_type = "t3.medium"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.stellar-sg.id}"]
   associate_public_ip_address = false
   source_dest_check = false
   #iam_instance_profile = "${aws_iam_instance_profile.stellar_profile.name}"
root_block_device {
    volume_size = "8"
    volume_type = "standard"
  }

  tags = {
    Name = "test-core-3"
  }
}

resource "aws_instance" "test-core-4" {
   ami = "ami-065fd893330a3dc38"
   instance_type = "t3.medium"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.stellar-sg.id}"]
   associate_public_ip_address = false
   source_dest_check = false
   #iam_instance_profile = "${aws_iam_instance_profile.stellar_profile.name}"
root_block_device {
    volume_size = "8"
    volume_type = "standard"
  }

  tags = {
    Name = "test-core-2"
  }
}

resource "aws_instance" "test-core-5" {
   ami = "ami-0317bdf017d952886"
   instance_type = "t3.medium"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.stellar-sg.id}"]
   associate_public_ip_address = false
   source_dest_check = false
   #iam_instance_profile = "${aws_iam_instance_profile.stellar_profile.name}"
root_block_device {
    volume_size = "8"
    volume_type = "standard"
  }

  tags = {
    Name = "test-core-2"
  }
}

###########################
# Define Stellar-tests NLB#
###########################
resource "aws_lb" "node1-nlb" {
  name               = "node1-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["${aws_subnet.public-subnet.id}"]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "stellar1_front_end" {
  load_balancer_arn = "${aws_lb.node1-nlb.arn}"
  port              = "11625"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.node1-nlb-tg.arn}"
  }
}


resource "aws_lb_target_group" "node1-nlb-tg" {
  name     = "node1-nlb-tg"
  port     = 11625
  protocol = "TCP"
  target_type = "instance"
  vpc_id   = "${aws_vpc.Application-VPC.id}"
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = "${aws_lb_target_group.node1-nlb-tg.arn}"
  target_id        = "${aws_instance.test-core-1.id}"
  port             = 11625
}
#####################
# Define Stellar-2 NLB #
######################
resource "aws_lb" "node2-nlb" {
  name               = "node2-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["${aws_subnet.public-subnet.id}"]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "stellar2_front_end" {
  load_balancer_arn = "${aws_lb.node2-nlb.arn}"
  port              = "11625"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.node2-nlb-tg.arn}"
  }
}


resource "aws_lb_target_group" "node2-nlb-tg" {
  name     = "node2-nlb-tg"
  port     = 11625
  protocol = "TCP"
  target_type = "instance"
  vpc_id   = "${aws_vpc.Application-VPC.id}"
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = "${aws_lb_target_group.node2-nlb-tg.arn}"
  target_id        = "${aws_instance.test-core-2.id}"
  port             = 11625
}
########################
# Define Stellar 3 NLB #
########################
resource "aws_lb" "node3-nlb" {
  name               = "node3-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["${aws_subnet.public-subnet.id}"]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "stellar3_front_end" {
  load_balancer_arn = "${aws_lb.node3-nlb.arn}"
  port              = "11625"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.node3-nlb-tg.arn}"
  }
}


resource "aws_lb_target_group" "node3-nlb-tg" {
  name     = "node3-nlb-tg"
  port     = 11625
  protocol = "TCP"
  target_type = "instance"
  vpc_id   = "${aws_vpc.Application-VPC.id}"
}

resource "aws_lb_target_group_attachment" "attach3" {
  target_group_arn = "${aws_lb_target_group.node3-nlb-tg.arn}"
  target_id        = "${aws_instance.test-core-3.id}"
  port             = 11625
}
#####################
# Define Stellar-4 NLB #
######################
resource "aws_lb" "node4-nlb" {
  name               = "node4-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["${aws_subnet.public-subnet.id}"]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "stellar4_front_end" {
  load_balancer_arn = "${aws_lb.node4-nlb.arn}"
  port              = "11625"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.node4-nlb-tg.arn}"
  }
}


resource "aws_lb_target_group" "node4-nlb-tg" {
  name     = "node4-nlb-tg"
  port     = 11625
  protocol = "TCP"
  target_type = "instance"
  vpc_id   = "${aws_vpc.Application-VPC.id}"
}

resource "aws_lb_target_group_attachment" "attach4" {
  target_group_arn = "${aws_lb_target_group.node4-nlb-tg.arn}"
  target_id        = "${aws_instance.test-core-4.id}"
  port             = 11625
}

#####################
# Define Stellar 5 NLB #
######################
resource "aws_lb" "node5-nlb" {
  name               = "node5-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["${aws_subnet.public-subnet.id}"]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "stellar5_front_end" {
  load_balancer_arn = "${aws_lb.node5-nlb.arn}"
  port              = "11625"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.node5-nlb-tg.arn}"
  }
}


resource "aws_lb_target_group" "node5-nlb-tg" {
  name     = "node5-nlb-tg"
  port     = 11625
  protocol = "TCP"
  target_type = "instance"
  vpc_id   = "${aws_vpc.Application-VPC.id}"
}

resource "aws_lb_target_group_attachment" "attach5" {
  target_group_arn = "${aws_lb_target_group.node5-nlb-tg.arn}"
  target_id        = "${aws_instance.test-core-5.id}"
  port             = 11625
}


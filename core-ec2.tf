
##################
# EC2 Instances ##
##################
# Define stellar inside the private subnet

resource "aws_instance" "test-core-1" {
   ami = "ami-0508afd57884cabb6"
   instance_type = "t3.medium"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.stellar-sg.id}"]
   associate_public_ip_address = false
   source_dest_check = false
   iam_instance_profile = "${aws_iam_instance_profile.stellar_profile.name}"
root_block_device {
    volume_size = "8"
    volume_type = "standard"
  }

  tags {
    Name = "test-core-1"
  }
}


resource "aws_instance" "test-core-2" {
   ami = "ami-04679bce4e1ebc712"
   instance_type = "t3.medium"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.stellar-sg.id}"]
   associate_public_ip_address = false
   source_dest_check = false
   iam_instance_profile = "${aws_iam_instance_profile.stellar_profile.name}"
root_block_device {
    volume_size = "8"
    volume_type = "standard"
  }

  tags {
    Name = "test-core-2"
  }
}

###############################
##   AWS  Connection config ##
##############################

provider "aws" {
  region                  = "${var.aws_region}"
  shared_credentials_file = "/credentials"
  profile                 = "default"
}


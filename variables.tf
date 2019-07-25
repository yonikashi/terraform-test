#########################
# Variables to override #
#########################

variable "NODENAME" {
  description = "The Name of the Node Partner"
  default = "node"
}

variable "SUFFIX" {
  description = "Unique suffix for Node"
  default = "suf42"
}

variable "DB_USER" { default = "stellar" }
variable "DB_PASS" { default = "defaultpassword" }
variable "DB_NAME" { default = "core" }
variable "DB_IDENTIFIER" { default = "stellar-core-db" }

#####################
# Key to launch EC2 #
#####################

variable "key_path" {
  description = "SSH Public Key path"
  #default = "/root/.ssh/id_rsa.pub"
  default = "/var/jenkins_home/workspace/Test-Job/terraform-test/ec2key/key.pub"
}

#######################
# Region to deploy on #
#######################

variable "aws_region" {
  description = "Region for the VPC"
}

#######################
# Application Subnets # 
#######################

variable "app_vpc_cidr" {
  description = "CIDR for the VPC"
  default = "172.31.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "172.31.16.0/20"
}

variable "public_b_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "172.31.32.0/20"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "172.31.0.0/20"
}

variable "private_subnet_b_cidr" {
  description = "CIDR for the private subnet"
  default = "172.31.48.0/20"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-0d8f6eb4f641ef691"
}


###################
#  Default AMI's  #
###################

variable "prometheus" {
  description = "Default Prometheus AMI"
  default = "ami-0b3cd5acb9089e468"
}

variable "test_core_1_ami" {
  description = "Default Node-1 AMI"
  default = "ami-0f0640cb26740d676"
}

variable "test_core_2_ami" {
  description = "Default Node-2 AMI"
  default = "ami-0329dc5c2d5aaac82"
}

variable "test_core_3_ami" {
  description = "Default Node-3 AMI"
  default = "ami-05641141dae12d64c"
}

variable "test_core_4_ami" {
  description = "Default Node-4 AMI"
  default = "ami-065fd893330a3dc38"
}

variable "test_core_5_ami" {
  description = "Default Node-5 AMI"
  default = "ami-0317bdf017d952886"
}

variable "horizon_1_ami" {
  description = "Default Horizon-1 AMI"
  default = "ami-02cd4ad493bbcc441"
}

variable "test_load_client_ami" {
  description = "Load Test AMI"
  default = "ami-0ebbab6be7ad25d13"
}

variable "test_watcher_core_1_ami" {
  description = "Load Test AMI"
  default = "ami-0e4f3eb1833df2eef"
}


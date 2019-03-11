variable "region" {
  default = "us-east-1"
}

variable "az" {
  default = "us-east-1b"
}

variable "ec2_ami" {
  description = "ECS optimized AMI for EC2 instances running"
  default     = "ami-0d0334aaafbee3d93"
}

variable "vpc_id" {
  default = "vpc-0ec46ccebc8108670"
}

variable "subnet_id" {
  default = "subnet-0cca46fa0d5d9c31d"
}

variable "cidr_blocks" {
  type = "list"
  default = [
    "172.16.0.0/12",
    "10.112.168.0/21"
  ]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "user" {
  default = "ec2-user"
}

variable "key_pair_name" {
  default = "cse-cnr"
}

variable "pem_file" {
  type = "string"
  default = "files/cse-cnr.pem"
}

variable "security_group_name" {
  default = "ec2-demo"
}

variable "demo_user" {
  default = "cxs349"
}

variable "ec2_name" {
  default = "ec2-demo"
}
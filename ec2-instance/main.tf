locals {
  common_tags         = {
    environment      = "${terraform.workspace}"
    application      = "terraform-demo"
    tier             = "app",
    version          = "N.A"
    costcenter       = "3246"
    businessunit     = "appsrvs-cnr"
    supportemail     = "dublincollectioncloudteam@equifax.com"
    compliancedomain = "N.A"
    dataclass        = "N.A"
    provisionedby    = "Terraform"
  }
  security_group_name = "${terraform.workspace}-${var.security_group_name}"
  ec2-name            = "${terraform.workspace}-demo-ec2"
}

resource "aws_instance" "ec2" {
  availability_zone    = "${var.az}"
  ami                  = "${var.ec2_ami}"
  instance_type        = "${var.instance_type}"
  subnet_id            = "${var.subnet_id}"
  key_name             = "${var.key_pair_name}"
  security_groups      = [
    "${aws_security_group.ec2_sg.id}"
  ]

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.ec2-name}",
      "name", "${local.ec2-name}"
    )
  )}"

  provisioner "file" {
    source      = "files/.bash_profile"
    destination = "/home/${var.user}/.bash_profile"
    connection {
      user        = "${var.user}"
      private_key = "${file(var.pem_file)}"
    }
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "${local.security_group_name}"
  description = "Allow traffic for SSH"
  vpc_id      = "${var.vpc_id}"
  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.security_group_name}",
      "name", "${local.security_group_name}"
    )
  )}"
}

resource "aws_security_group_rule" "outbound_internet_access" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [
    "0.0.0.0/0"
  ]
  security_group_id = "${aws_security_group.ec2_sg.id}"
}

resource "aws_security_group_rule" "ssh_access" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = [
    "${var.cidr_blocks}"
  ]
  security_group_id = "${aws_security_group.ec2_sg.id}"
}
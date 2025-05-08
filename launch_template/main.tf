resource "aws_launch_template" "web_lt" {
  name                   = var.name
  image_id               = var.image_id
  instance_type          = var.instance_type
  key_name               = var.ssh_key_name
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = var.my_tags
}


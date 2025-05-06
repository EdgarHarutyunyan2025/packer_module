resource "aws_autoscaling_group" "web" {
  name                = var.autoscaling_group_name
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  min_elb_capacity    = var.min_elb_capacity
  health_check_type   = var.health_check_type
  vpc_zone_identifier = var.vpc_zone_identifier
  target_group_arns   = var.target_group_arns

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  dynamic "tag" {
    for_each = {
      Name    = "WebServer in ASG v  ${var.versions}"
      Project = "DevOps"
    }

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

#resource "aws_autoscaling_policy" "scale_up" {
#  name                   = var.autoscaling_policy_name
#  scaling_adjustment     = var.scaling_adjustment
#  adjustment_type        = var.adjustment_type
#  cooldown               = var.cooldown
#  autoscaling_group_name = var.policy_autoscaling_group_name
#}
#
#resource "aws_autoscaling_policy" "scale_down" {
#  name                   = var.autoscaling_policy_name
#  scaling_adjustment     = var.scaling_adjustment
#  adjustment_type        = var.adjustment_type
#  cooldown               = var.cooldown
#  autoscaling_group_name = var.policy_autoscaling_group_name
#}
#
#output "web_loadbalancer_url" {
#  value = aws_lb.web_lb.dns_name
#}
#

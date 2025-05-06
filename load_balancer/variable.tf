variable "name" {
  default = "green-blue-ALB"
}

variable "load_balancer_type" {
  default = "application"
}

variable "security_groups" {
  default = []
}

variable "subnets" {
  default = []

}

variable "target_group_name" {
  default = "green-blue-tg"
}

variable "tg_vpc_id" {
  default = ""
}

variable "tg_port" {
  default = 80
}

variable "tg_protocol" {
  default = "HTTP"
}

variable "tg_deregistration_delay" {
  default = 10
}

variable "listener_load_balancer_arn" {
  default = ""
}

variable "listener_port" {
  default = "80"
}

variable "listener_protocol" {
  default = "HTTP"
}

variable "default_action_type" {
  default = "forward"
}

variable "default_action_target_group_arn" {
  default = ""
}

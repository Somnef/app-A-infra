variable "alb_listener_port" {
  type        = number
  default     = 80
  description = "Port on which the ALB should be listening"
}

variable "target_group_port" {
  type        = number
  default     = 80
  description = "Port on which the ALB's target group should be listening"
}
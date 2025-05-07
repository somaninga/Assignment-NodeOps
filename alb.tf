resource "aws_lb" "rpc_alb" {
  name               = "NodeOps-Demo-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.vpc.public_subnets
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.rpc_alb.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type             = "fixed-response"
    fixed_response {
      status_code = 200
      content_type = "text/plain"
      message_body = "OK"
    }
  }
}

resource "aws_wafv2_web_acl_association" "alb_attach" {
  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.rpc_waf.arn
}
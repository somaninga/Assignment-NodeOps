resource "aws_wafv2_web_acl" "rpc_waf" {
  name        = "rpc-waf-nodeops-demo"
  description = "WAF for EVM RPC endpoints"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "rpcWAF"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "LimitRequestsByIP"
    priority = 1

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = 1000
        aggregate_key_type = "IP"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "LimitRequestsByIP"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "BlockCommonBots"
    priority = 2

    statement {
      managed_rule_group_statement {
        name        = "CommonRuleSet"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "CommonBots"
      sampled_requests_enabled   = true
    }
  }
}

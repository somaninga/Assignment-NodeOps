# AWS WAF Module

This module provisions a WAFv2 Web ACL to protect the EVM RPC endpoints from:

- DDoS attacks
- Common web exploits (via managed rules)
- High request rates

### Rules:
- ✅ AWS Managed Rule Set for bots/exploits
- ✅ Custom rule: Block IPs exceeding 1000 requests/5min

### Integration:
- Web ACL is associated with the ALB in front of Nginx Ingress

## Usage

```hcl
module "waf" {
  source   = "./modules/waf"
  alb_arn  = module.alb.alb_arn
}

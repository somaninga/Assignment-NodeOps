# Nginx Load Balancer for EVM RPC Cluster

This module deploys a high-availability Nginx reverse proxy in front of EVM full nodes with:
- TLS termination
- IP whitelisting
- Rate limiting
- Backend load balancing

## Usage

To use this module in `main.tf`:

```hcl
module "nginx_lb" {
  source = "./modules/nginx-lb"
}

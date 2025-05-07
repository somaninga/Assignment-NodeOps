module "vpc" {
  source = "./vpc.tf"
}

module "eks" {
  source = "./eks-cluster.tf"
}

module "alb" {
  source = "./alb.tf"
}

module "nginx_lb" {
  source = "./modules/nginx-lb"
}

module "observability" {
  source = "./modules/observability"
}

module "waf" {
  source = "./modules/waf"
  alb_arn = module.alb.alb_arn
}

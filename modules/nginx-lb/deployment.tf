resource "kubernetes_config_map" "nginx_config" {
  metadata {
    name      = "nginx-config"
    namespace = "nodeops-evm-node-demo"
  }

  data = {
    "nginx.conf" = file("${path.module}/config/nginx.conf")
  }
}

resource "helm_release" "nginx_lb" {
  name       = "nginx-lb"
  namespace  = "nodeops-evm-node-demo"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"

  values = [
    file("${path.module}/values.yaml")
  ]

  depends_on = [
    kubernetes_config_map.nginx_config
  ]
}

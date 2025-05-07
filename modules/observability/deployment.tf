resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = "monitoring"
  chart      = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"

  values = [file("${path.module}/values/prometheus.yaml")]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  namespace  = "monitoring"
  chart      = "grafana"
  repository = "https://grafana.github.io/helm-charts"

  values = [file("${path.module}/values/grafana.yaml")]

  set {
    name  = "adminPassword"
    value = "nodeopsdemo!@#$" # Use a more secure secret in production
  }

  depends_on = [helm_release.prometheus]
}

resource "helm_release" "loki" {
  name       = "loki"
  namespace  = "monitoring"
  chart      = "loki"
  repository = "https://grafana.github.io/helm-charts"

  values = [file("${path.module}/values/loki.yaml")]
}

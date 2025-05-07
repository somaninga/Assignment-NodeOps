resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  namespace  = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.14.3"

  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}
resource "local_file" "cluster_issuer" {
  filename = "${path.module}/cluster-issuer-rendered.yaml"
  content  = file("${path.module}/cluster-issuer.yaml")
}

resource "null_resource" "apply_issuer" {
  depends_on = [helm_release.cert_manager]

  provisioner "local-exec" {
    command = "kubectl apply -f ${local_file.cluster_issuer.filename}"
  }
}

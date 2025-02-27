resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.51.3" # Change to the latest stable version
  # values = [
  #   <<EOF
  #   server:
  #     service:
  #       type: LoadBalancer
  #   EOF
  # ]

  set {
    name  = "metadata.labels.app.kubernetes.io/managed-by"
    value = "Helm"
  }
  set {
  name  = "server.service.type"
  value = "LoadBalancer"
}


  # set {
  #   name  = "metadata.annotations.meta.helm.sh/release-name"
  #   value = "argocd"
  # }

  set {
    name  = "metadata.annotations.meta.helm.sh/release-namespace"
    value = "argocd"
  }

  depends_on = [kubernetes_namespace.argocd] # Explicit dependency, but Terraform will handle this automatically
}

provider "helm" {
  kubernetes {
    config_path = "C:/Users/User/.kube/config" # Adjust if using another kubeconfig path
  }
}

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  namespace  = "kube-system"
  chart      = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = "4.10.1"  # You can use the latest stable version

  set {
    name  = "controller.service.type"
    value = "LoadBalancer" # Exposes the Ingress Controller to the internet
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Cluster"  # Keeps client IP for logs and metrics
  }
}

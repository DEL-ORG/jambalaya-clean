resource "kubernetes_ingress" "app_ingress" {
  metadata {
    name      = "app-ingress"
    namespace = kubernetes_namespace.s7rosine.metadata[0].name
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      host = "thejurist.org.uk"

      http {
        path {
          path      = "/"
          pathType  = "Prefix"  # ✅ Use "pathType" instead of "path_type"

          backend {
            service {
              name = "s7rosine-jambalaya-service"  # ✅ Make sure this service exists
              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }
}

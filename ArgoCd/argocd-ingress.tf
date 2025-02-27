# resource "kubernetes_ingress_v1" "argocd_ingress" {
#   metadata {
#     name      = "argocd-ingress"
#     namespace = kubernetes_namespace.argocd.metadata[0].name
#     annotations = {
#       "nginx.ingress.kubernetes.io/rewrite-target" = "/"
#     }
#   }

#   spec {
#     rule {
#       host = "argocd.thejurist.org.uk"  # Your ArgoCD URL

#       http {
#         path {
#           path      = "/"
#           path_type = "Prefix"
#           backend {
#             service {
#               name = "argocd-server"
#               port {
#                 number = 80
#               }
#             }
#           }
#         }
#       }
#     }
#   }
# }

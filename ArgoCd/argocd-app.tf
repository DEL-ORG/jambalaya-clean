# resource "kubernetes_namespace" "jambalaya" {
#   metadata {
#     name = "s7rosine"
#   }
# }

# resource "argocd_application" "springboot_app" {
#   metadata {
#     name      = "s7rosine-jambalaya"
#     namespace = "argocd"
#   }

#   spec {
#     project = "default"

#     source {
#       repo_url        = "https://github.com/DEL-ORG/jambalaya-clean.git"
#       target_revision = "main"  # The branch in GitHub
#       path            = "chart" # The folder where Helm charts are
#     }

#     destination {
#       server    = "https://kubernetes.default.svc"
#       namespace = kubernetes_namespace.jambalaya.metadata[0].name
#     }

#     sync_policy {
#       automated {
#         self_heal   = true
#         prune       = true
#       }
#     }
#   }
# }

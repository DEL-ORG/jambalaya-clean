resource "kubernetes_namespace" "s7rosine" {
  metadata {
    name = "s7rosine"
  }
}

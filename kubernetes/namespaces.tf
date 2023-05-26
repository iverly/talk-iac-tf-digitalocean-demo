resource "kubernetes_namespace_v1" "iac_tf_kubernetes_namespace" {
  metadata {
    name = var.namespace
  }
}

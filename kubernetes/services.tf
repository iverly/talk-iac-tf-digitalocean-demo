resource "kubernetes_service" "iac_tf_kubernetes_service_nginx" {
  metadata {
    name      = "my-app"
    namespace = kubernetes_namespace_v1.iac_tf_kubernetes_namespace.metadata.0.name
  }

  spec {
    selector = {
      App = kubernetes_deployment.iac_tf_kubernetes_deployment_nginx.spec.0.template.0.metadata[0].labels.App
    }

    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }

  wait_for_load_balancer = false
}

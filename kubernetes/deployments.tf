resource "kubernetes_deployment" "iac_tf_kubernetes_deployment_nginx" {
  metadata {
    name      = "my-app"
    namespace = kubernetes_namespace_v1.iac_tf_kubernetes_namespace.metadata.0.name
    labels = {
      App = "MyApp"
    }
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        App = "MyApp"
      }
    }
    template {
      metadata {
        labels = {
          App = "MyApp"
        }
      }
      spec {
        container {
          image = "bitnami/nginx:1.25.0-debian-11-r0"
          name  = "nginx"

          port {
            container_port = 8080
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

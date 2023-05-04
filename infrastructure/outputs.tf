output "kubernetes_cluster_id" {
  value       = digitalocean_kubernetes_cluster.iac_tf_digitalocean_kubernetes_cluster.id
  description = "The ID of the Kubernetes cluster"
}

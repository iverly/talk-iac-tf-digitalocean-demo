resource "digitalocean_kubernetes_cluster" "iac_tf_digitalocean_kubernetes_cluster" {
  name         = "iac-tf-digitalocean-kubernetes-cluster"
  region       = var.digital_region
  auto_upgrade = false
  version      = "1.26.3-do.0"
  vpc_uuid     = digitalocean_vpc.iac_tf_digitalocean_vpc.id

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  node_pool {
    name       = "default"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes  = 3
    max_nodes  = 5
  }
}

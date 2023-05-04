resource "digitalocean_project" "iac_tf_digitalocean_project" {
  name        = "iac-tf-digitalocean"
  description = "Demo of Infrastructure as Code with Terraform"
  environment = "Production"
}

resource "digitalocean_project_resources" "iac_tf_digitalocean_project_resources" {
  project = digitalocean_project.iac_tf_digitalocean_project.id
  resources = [
    digitalocean_kubernetes_cluster.iac_tf_digitalocean_kubernetes_cluster.urn,
  ]
}

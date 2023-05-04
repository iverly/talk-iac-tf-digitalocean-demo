resource "digitalocean_vpc" "iac_tf_digitalocean_vpc" {
  name     = "iac-tf-digitalocean-vpc"
  region   = var.digital_region
  ip_range = "10.0.0.0/24"
}

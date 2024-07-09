terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  backend "pg" {
  }
}

provider "digitalocean" {

}

# resource "digitalocean_certificate" "cert" {
#   name    = "le-lesanpi.dev"
#   type    = "lets_encrypt"
#   domains = ["lesanpi.dev", "www.lesanpi.dev"]
# }
resource "digitalocean_ssh_key" "ssh_key" {
  name       = "General SSH Key"
  public_key = file("${path.module}/files/id_rsa.pub")
}

resource "digitalocean_droplet" "droplet" {
  image  = "ubuntu-20-04-x64"
  name   = "lesanpidev"
  region = "nyc1"
  size   = "s-1vcpu-512mb-10gb"
  ssh_keys = [
    // Insert keys
    digitalocean_ssh_key.ssh_key.id
  ]
  user_data = file("${path.module}/files/user-data.sh")
}

# Create a new domain
# resource "digitalocean_domain" "domain" {
#   name       = "lesanpi.dev"
#   ip_address = digitalocean_droplet.droplet.ipv4_address
# }


# Create record
resource "digitalocean_record" "www" {
  domain = "lesanpi.dev"
  name   = "www"
  type   = "A"
  value  = digitalocean_droplet.droplet.ipv4_address
  ttl    = 1800
}

resource "digitalocean_record" "main" {
  domain = "lesanpi.dev"
  name   = "@"
  type   = "A"
  value  = digitalocean_droplet.droplet.ipv4_address
  ttl    = 1800

}

resource "digitalocean_record" "app" {
  domain = "lesanpi.dev"
  name   = "app"
  type   = "A"
  value  = digitalocean_droplet.droplet.ipv4_address
  ttl    = 1800

}

resource "digitalocean_record" "demo" {
  domain = "lesanpi.dev"
  name   = "demo"
  type   = "A"
  value  = digitalocean_droplet.droplet.ipv4_address
  ttl    = 1800
}
resource "digitalocean_record" "jenkins" {
  domain = "lesanpi.dev"
  name   = "jenkins"
  type   = "A"
  value  = digitalocean_droplet.droplet.ipv4_address
  ttl    = 1800

}

terraform {
  backend "s3" {
    key     = "personal.infra.tfstate"
    bucket  = "dantoml-tf-state"
    region  = "us-east-1"
    profile = "personal"
  }

  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }

    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

provider "cloudflare" {}

provider "scaleway" {
  region  = "fr-par"
  zone    = "fr-par-1"
  version = "~> 1.11"
}

terraform {
  backend "s3" {
    key     = "personal.infra.tfstate"
    bucket  = "dantoml-tf-state"
    region  = "us-east-1"
    profile = "personal"
  }
}

provider "cloudflare" {}

provider "scaleway" {
  region  = "fr-par"
  zone    = "fr-par-1"
  version = "~> 1.11"
}

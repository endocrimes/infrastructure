terraform {
  required_version = "~> 0.11.0"

  backend "s3" {
    key     = "personal.infra.tfstate"
    bucket  = "dantoml-tf-state"
    region  = "us-east-1"
    profile = "personal"
  }
}

provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

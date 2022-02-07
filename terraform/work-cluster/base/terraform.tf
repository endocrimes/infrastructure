terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }

    google = {
      source  = "hashicorp/google"
      version = "4.10.0"
    }
  }

  cloud {
    organization = "endocrimes"
    workspaces {
      name = "infrastructure-work-cluster"
    }
  }
}

provider "google" {
  project = "dlancashire-k8s-dev"
  region  = "europe-west3-b" # Frankfurt, with GPU support.
}

provider "cloudflare" {}


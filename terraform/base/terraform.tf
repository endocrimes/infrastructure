terraform {
  cloud {
    organization = "endocrimes"

    workspaces {
      name = "infrastructure"
    }
  }

  required_providers {
    dnsimple = {
      source  = "dnsimple/dnsimple"
      version = "~> 0.14.0"
    }
  }
}

variable "dnsimple_token" {
  type = string
}

variable "dnsimple_account" {
  type = string
}

provider "dnsimple" {
  token   = var.dnsimple_token
  account = var.dnsimple_account
}

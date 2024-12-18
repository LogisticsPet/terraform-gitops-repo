terraform {
  required_version = "1.10.2"
  required_providers {
    github = {
      source  = "integrations/github"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

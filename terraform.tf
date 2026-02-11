terraform {
  required_version = "1.10.3"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.11.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

variable "github_token" {
  type      = string
  sensitive = true
}

provider "github" {
  token         = var.github_token
  owner         = "la-catalog"
  read_delay_ms = 1000
}

data "github_repositories" "terraform" {
  query = "org:la-catalog topic:terraform"
}

data "github_repositories" "python" {
  query = "org:la-catalog topic:python"
}

data "github_repositories" "python_package" {
  query = "org:la-catalog topic:python topic:package"
}
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.20.0"
    }
  }
}

variable "machine_ip" {
  type      = string
  sensitive = true
}

variable "machine_user" {
  type      = string
  sensitive = true
}

variable "machine_pass" {
  type      = string
  sensitive = true
}

provider "docker" {
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]

  registry_auth {
    address  = "${var.machine_ip}:22"
    username = var.machine_user
    password = var.machine_pass
  }
}
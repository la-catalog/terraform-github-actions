terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.20.0"
    }
  }
}

provider "docker" {
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]

  registry_auth {
    address  = "${var.machine_ip}:${var.machine_port}"
    username = var.machine_user
    password = var.machine_pass
  }
}

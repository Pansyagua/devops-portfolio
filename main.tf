
terraform {
      required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.11.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "kind" {}
provider "docker" {}

# 1. Skapa ett gratis lokalt Container Registry 
resource "docker_container" "local_registry" {
  name    = "kind-registry"
  image   = "registry:2"
  restart = "always"
  
  ports {
    internal = 5000
    external = 5001
    ip       = "127.0.0.1"
  }
}

# 2. Starta ett 3-nods Kubernetes-kluster (1 Control Plane, 2 Workers)
resource "kind_cluster" "devops_env" {
  name           = "production-replica"
  wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }
    node {
      role = "worker"
    }
    node {
      role = "worker"
    }
  }
  
  depends_on = [docker_container.local_registry]
}
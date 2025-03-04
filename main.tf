terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.16.0"
    }
  }
}
 
provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}
 
resource "docker_image" "node_image" {
  name         = "node:latest"
  keep_locally = false
}
 
resource "docker_container" "node_app" {
  name  = "node_web_app"
  image = docker_image.node_image.name
 
  ports {
    internal = 3000
    external = 3000
  }
 
  volumes {
    host_path      = replace(abspath("${path.module}"), "D:/", "/d/")
    container_path = "/usr/src/app"
  }
 
  working_dir = "/usr/src/app"
  command     = ["node", "app.js"]
 
  env = [
    "NODE_ENV=production"
  ]
}
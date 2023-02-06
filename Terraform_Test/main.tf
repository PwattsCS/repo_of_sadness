terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

provider "docker" {
  # Configuration options
}
# Create a docker image resource
# -> docker pull nginx:latest
resource "docker_image" "ubuntu" {
  name         = "ubuntu:latest"
  keep_locally = true
}

# Create a docker container resource
# -> same as 'docker run --name nginx -p8080:80 -d nginx:latest'
resource "docker_container" "ubuntu" {
  name    = "ubuntu"
  image   = docker_image.ubuntu.image_id
}
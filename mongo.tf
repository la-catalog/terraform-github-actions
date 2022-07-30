resource "docker_image" "mongo" {
  name = "mongo:latest"
}

resource "docker_container" "mongo" {
  image = docker_image.mongo.latest
  name  = "mongo"
  ports {
    internal = 27017
    external = 27017
  }
}
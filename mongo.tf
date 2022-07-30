resource "docker_image" "mongo_img" {
  name = "mongo:latest"
}

resource "docker_container" "mongo" {
  image = docker_image.mongo_img.latest
  name  = "mongo"
  ports {
    internal = 27017
    external = 27017
  }
}
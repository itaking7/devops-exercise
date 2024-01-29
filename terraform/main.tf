provider "aws" {
  region = "us-east-1"  # region hardcoded
}


terraform {
  backend "s3" {
    bucket         = "terraform-state-kingsley"
    key            = "devops-exercise/containers/terraform.tfstate"
    region         = "us-east-1"
  }
}
/*resource "aws_s3_bucket" "my_bucket" {
  bucket = "kingsley-bucket-test001" 
  acl    = "private"  # Access control list, options: private, public-read, public-read-write, authenticated-read
  tags = {
    Name        = "MyBucket"
    Environment = "Production"
  }

}
*/

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}
# Define Docker provider
provider "docker" {
  host = "tcp://172.31.46.111:2376/"
  registry_auth {
    address  = "registry-1.docker.io"
    username = "dominionsystemsinc"
    password = "Kizee-@#000"
  }
}

# Define Docker containers
resource "docker_container" "redis_container" {
  image = "dominionsystemsinc/redis-devops-exercise"
  name  = "redis_container"
  ports {
    internal = 6379
    external = 6379
  }
}

resource "docker_container" "back_container" {
  image        = "dominionsystemsinc/backend-devops-exercise"
  name         = "back_container"
  ports {
    internal = 4000
    external = 4000
  }
  #env = {
   # REDIS_SERVER = "redis_container:6379"
  #}
  depends_on = [docker_container.redis_container]
}

resource "docker_container" "front_container" {
  image        = "dominionsystemsinc/frontend-devops-exercise"
  name         = "front_container"
  ports {
    internal = 3000
    external = 3000
  }
 # env = {
  #  BACKEND_API_URL = "http://back_container:4000"
   # CLIENT_API_URL  = "http://back_container:4000"
  #}
  depends_on = [docker_container.back_container]
}





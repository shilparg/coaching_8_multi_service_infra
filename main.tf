provider "aws" {
  region = var.region
}

module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 5.9.0"

  cluster_name = "flask-cluster"

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 100
      }
    }
  }

  services = {
    s3-service = {
      name              = "flask-s3-service"
      container_image   = "your_ecr_url/flask-s3-service:latest"
      cpu               = 256
      memory            = 512
      desired_count     = 1
      port_mappings     = [{ containerPort = 5000 }]
    }

    sqs-service = {
      name              = "flask-sqs-service"
      container_image   = "your_ecr_url/flask-sqs-service:latest"
      cpu               = 256
      memory            = 512
      desired_count     = 1
      port_mappings     = [{ containerPort = 5000 }]
    }
  }
}
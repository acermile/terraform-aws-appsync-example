
terraform {
  required_version = ">= 0.12"
}

provider "random" {
  version = "~> 2.1"
}

provider "local" {
  version = "~> 1.2"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}

provider "aws" {
  version = ">= 2.28.1"
  region  = "us-east-1"
  #  profile = "csa"
  profile = var.AWS_PROFILE
}

/*provider "helm" {
  version         = "~> 1.2.0"
  service_account = kubernetes_cluster_role_binding.tiller.metadata.0.name
  namespace       = kubernetes_service_account.tiller.metadata.0.namespace
}*/

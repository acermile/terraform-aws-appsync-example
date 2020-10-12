variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 8080]
}

variable "instance-type" {

  default = "t2.micro"
}

variable "aws-region" {
  default = "us-east-1"
}

variable "AWS_PROFILE" {

  default = "csa"

}

variable "environment" {

  default = "uat"

}

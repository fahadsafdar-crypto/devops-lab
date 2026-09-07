variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "devops-lab-ec2"
}

variable "ssh_cidr" {
  type        = string
  description = "My public IP with /32"
}

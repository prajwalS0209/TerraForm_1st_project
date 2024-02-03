variable "instance_type" {
  type = string
  description = "instance type"
}

variable "ami" {
  type = string
  description = "ami"
}

variable "public_subnet" {
  type = string
  description = "subnet for public instance"
}

variable "private_subnet" {
  type = string
  description = "subnet for private instance"
}
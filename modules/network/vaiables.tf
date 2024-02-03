variable "vpc_id" {
  type = string 
  description = "vpc id"
}

variable "public_cidr" {
  type = string
  description = "vpc cidr block"
}

variable "private_cidr" {
  type = string
  description = "vpc cidr block"
}

variable "zone-a" {
  type = string 
  description = "availability zone "
}

variable "zone-b" {
  type = string 
  description = "availability zone "
}
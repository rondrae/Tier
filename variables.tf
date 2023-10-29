variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "VPC cidr block"
  type = string
}

variable "public_web_sub_01_cidr" {
  default = "10.0.1.0/24"
  type = string
  description = "public web subnet 1"
}

variable "public_web_sub_02_cidr" {
  default = "10.0.2.0/24"
  type = string
  description = "public web subnet 2"
}


variable "private_app_sub_01-cidr" {
  default = "10.0.3.0/24"
  description = "private app subnet 1"
  type = string
}

variable "private_app_sub_02-cidr" {
  default = "10.0.4.0/24"
  description = "private app subnet 2"
  type = string
}

variable "private_db_sub_01-cidr" {
  default = "10.0.5.0/24"
  description = "private db subnet 1"
  type = string
}

variable "private_db_sub_02-cidr" {
  default = "10.0.6.0/24"
  description = "private db subnet 2"
  type = string
}

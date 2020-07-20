variable "vpc_cidr" {
  type = string
  default = "192.168.0.0/16"
}

variable "vpc_enable_dns_hostnames" {
  type = bool
  default = true
}
variable "vpc_enable_dns_support" {
  type = bool
  default = true
}

variable "whitelisted_public_cidrs" {
  type = list(string)
  default = []
}

variable "allow_public_ssh" {
  type = bool
  default = false
}


variable "availability_zones" {
  type = list(string)
  default = [
    "ap-southeast-1a",
    "ap-southeast-1b"]
}

variable "private_subnet_cidrs" {
  default = []
}

variable "public_subnet_cidrs" {
  default = []
}



variable "resource_name" {
  type = string
}

variable "resource_type" {
  type = string
}

variable "delimiter" {
  type = string
  default = "_"
}

variable "common_tags" {
  type = object({
    owner = string
    project = string
  })
}

variable "custom_tags" {
  type = map(map(string))
  default = {}
}

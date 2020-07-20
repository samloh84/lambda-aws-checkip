variable "name" {
  type = string
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

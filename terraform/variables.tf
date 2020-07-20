

variable "common_tags" {
  type = object({
    owner = string
    project = string
  })
}

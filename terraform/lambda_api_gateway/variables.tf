
variable "lambda_zip_path" {
  type = string
}

variable "handler" {
  type = string
  default = "index.handler"
}
variable "timeout" {
  type = number
  default = 300
}



variable "vpc_id" {
  type = string
}
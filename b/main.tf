variable "file_name" {
  type    = string
  default = "test"
}

output "file_name" {
  value = var.file_name
}

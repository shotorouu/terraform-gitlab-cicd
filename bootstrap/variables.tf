variable "bucket_backend" {
  type        = string
  description = "Bucket for your backend statefile"
}

variable "table_backend" {
  type        = string
  description = "DynamooDB for your backend statefile"
}

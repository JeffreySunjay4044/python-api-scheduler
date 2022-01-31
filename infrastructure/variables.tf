variable "user" {
  description = "username for connecting to vertica"
  type        = string
}

variable "password_path" {
  description = "ssm path for connecting to vertica"
  type        = string
}

variable "env" {
  description = "env name"
  type        = string
}

variable "sqs_event_source_arn" {
  description = "sqs event_source_arn value"
  type        = string
}

variable "host" {
  description = "vertica db hostname"
  type        = string
}

variable "image_uri" {
  description = "kinesis lambda image uri"
  type        = string
}

variable "role" {
  description = "vertica rolename"
  type        = string
}

variable "api_role" {
  description = "api rolename"
  type        = string
}

variable "port" {
  description = "port number for connecting to vertica"
  type        = number
}

variable "database" {
  description = "vertica databse name"
  type        = string
}

variable "kinesis_process_parquet_bucket_name" {
  description = "S3 Bucket Name"
}

variable "description" {
  description = "Description for BEDAP secret"
  default     = "BEDAP Encrypted Cloudwatch Log Group for Kinesis Lambda"
}
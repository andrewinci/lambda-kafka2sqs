variable "function_name" {
  type        = string
  default     = "kafka-consumer"
  description = "Lambda function name"
}

variable "log_group_retention_days" {
  type        = number
  default     = 30
  description = "Cloudwatch log group retention in days"
}

# todo: support multiple topics
variable "kafka_topic" {
  type        = string
  description = "Kafka topic name"
}

variable "kafka_batch_size" {
  type        = number
  default     = 10
  description = "The largest number of records that Lambda will retrieve from each kafka topic"
}

variable "kafka_starting_position" {
  type        = string
  default     = "TRIM_HORIZON"
  description = "The position in the stream where AWS Lambda should start reading. Supported values are: LATEST, TRIM_HORIZON"
}

variable "kafka_endpoints" {
  type        = string
  description = "Comma separated kafka endpoints <ip>:<port>"
}

variable "kafka_subnet_ids" {
  type        = list(string)
  description = "List of subnets ids to use for the kafka event source"
  default     = []
}

variable "kafka_sg_ids" {
  type        = list(string)
  description = "List of security group id to access kafka"
  default     = []
}

variable "kafka_authentication_type" {
  type        = string
  description = "The authentication to perform to connect to kafka. Possible values are: \"BASIC\" or \"mTLS\"."
  validation {
    condition     = contains(["BASIC", "mTLS"], var.kafka_authentication_type)
    error_message = "Allowed values for kafka_authentication_type are \"BASIC\" or \"mTLS\"."
  }
}

variable "kafka_credentials_arn" {
  type        = string
  description = "The arn of the secret containing the kafka credentials. The content dependes on the \"kafka_authentication_type\" var."
  default     = ""
}

variable "kafka_ca_secret_arn" {
  type        = string
  description = "The arn of the secret containing the ca certificate in PEM format"
  default     = ""
}
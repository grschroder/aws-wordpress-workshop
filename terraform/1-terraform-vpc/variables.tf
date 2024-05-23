variable "AWS_REGION" {
  description = "The AWS region"
  default     = "us-east-1"
}

variable "AWS_ACCESS_KEY" {
  description = "The AWS access"
  default     = "access-key"
}

variable "AWS_SECRET_KEY" {
  description = "The AWS secret key"
  default     = "key"
}

variable "SSH_KEY_NAME" {
  description = "SSH key name"
}

variable "DB_USERNAME" {
  description = "Database username"
}

variable "DB_PASSWORD" {
  description = "Database password"  
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Region for resources"
  type        = string
  default     = "asia-southeast2"
}

variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
  default     = "tf-demo-instance"
}

variable "machine_type" {
  description = "Machine type for the instance"
  type        = string
  default     = "e2-medium"
}

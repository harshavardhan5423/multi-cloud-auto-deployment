# AWS Variables
variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "ssh_key_name" {
  description = "Existing AWS key pair name to attach (optional). If empty, instance allows only HTTP."
  type        = string
  default     = ""
}

variable "allow_ssh_cidr" {
  description = "CIDR to allow SSH from (if ssh_key_name is set)."
  type        = string
  default     = "0.0.0.0/0"
}

variable "instance_name_prefix" {
  type    = string
  default = "mc-nginx"
}

# GCP Variables
variable "gcp_project" {
  description = "GCP Project ID"
  type        = string
}

variable "gcp_region" {
  type    = string
  default = "us-central1"
}

variable "gcp_zone" {
  type    = string
  default = "us-central1-a"
}


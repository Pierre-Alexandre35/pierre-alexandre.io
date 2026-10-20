variable "project_id" {
  description = "Existing Google Cloud project hosting the website."
  type        = string
  default     = "personal-website-512218"
}

variable "bucket_name" {
  description = "Globally unique bucket name for public website assets."
  type        = string
  default     = "pierre-alexandre.io"
}

variable "location" {
  description = "Cloud Storage location. Changing this replaces the bucket."
  type        = string
  default     = "EUROPE-WEST9"
}

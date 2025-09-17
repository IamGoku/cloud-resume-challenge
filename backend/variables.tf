variable "project_name" {
  description = "Name prefix for resources"
  type        = string
  default     = "cloud-resume"
}

variable "region" {
  description = "AWS region (for most resources)"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Custom domain for CloudFront (e.g., amit-c00l-resume-website.cloudresumechallenge.click)"
  type        = string
  default = "amit-c00l-resume-website.cloudresumechallenge.click"

}

variable "acm_certificate_arn" {
  description = "ACM cert ARN in us-east-1 for the domain_name"
  type        = string
  default = "arn:aws:acm:us-east-1:160885264328:certificate/1c76973b-858d-4110-aaf8-8c40e3d13c8f"
}

variable "hosted_zone_id" {
  description = "Route53 hosted zone ID for the root zone that contains domain_name; leave empty to skip DNS record"
  type        = string
  default     = "Z0482291FJ2GIE4L4JXN"
}

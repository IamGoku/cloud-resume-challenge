output "api_url" {
  value       = aws_apigatewayv2_api.http.api_endpoint
  description = "HTTP API base URL (append /count)"
}

output "cloudfront_domain" {
  value       = aws_cloudfront_distribution.cdn.domain_name
  description = "CloudFront domain (if no Route53 alias)"
}

output "website_url" {
  value       = "https://${var.domain_name}"
  description = "Your website URL (if alias created)"
}

output "cloudfront_dist_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.cdn.id
}


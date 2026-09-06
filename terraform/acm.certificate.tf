resource "aws_acm_certificate" "portal" {
  domain_name       = "portal.jvictor.cloud"
  validation_method = "DNS"
}
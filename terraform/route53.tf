data "aws_route53_zone" "this" {
  name         = "jvictor.cloud"
  private_zone = false
}

resource "aws_route53_record" "portal" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "portal.jvictor.cloud"
  type    = "A"
  alias {
    name                   = aws_lb.this.dns_name
    zone_id                = aws_lb.this.zone_id
    evaluate_target_health = true
  }
}

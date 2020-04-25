data "cloudflare_zones" "danielle_fyi" {
  filter {
    name   = "danielle.fyi"
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "recipies-danielle-fyi-A" {
  zone_id = data.cloudflare_zones.danielle_fyi.zones[0].id
  name    = "recipies."
  value   = "178.63.8.90"
  type    = "A"
  ttl     = 1
  proxied = false
}

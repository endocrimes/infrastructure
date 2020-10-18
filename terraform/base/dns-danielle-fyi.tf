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

resource "cloudflare_record" "recipes-danielle-fyi-A" {
  zone_id = data.cloudflare_zones.danielle_fyi.zones[0].id
  name    = "recipes."
  value   = "178.63.8.90"
  type    = "A"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "photos-danielle-fyi-CNAME" {
  zone_id = data.cloudflare_zones.danielle_fyi.zones[0].id
  name    = "photos."
  value   = "178.63.8.90"
  type    = "A"
  ttl     = 1
  proxied = false
}

data "cloudflare_zones" "terrible_systems" {
  filter {
    name   = "terrible.systems"
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "dokku-2gb-lon1-01-terrible-systems-A" {
  zone_id = data.cloudflare_zones.terrible_systems.zones[0].id
  name    = "dokku-2gb-lon1-01"
  value   = "139.59.200.225"
  type    = "A"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "whereami-dokku-2gb-lon1-01-terrible-systems-A" {
  zone_id = data.cloudflare_zones.terrible_systems.zones[0].id
  name    = "whereami.dokku-2gb-lon1-01"
  value   = "139.59.200.225"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "jump-terrible-systems-A" {
  zone_id = data.cloudflare_zones.terrible_systems.zones[0].id
  name    = "jump"
  value   = scaleway_ip.jumphost.ip
  type    = "A"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "terrible-systems-MX" {
  zone_id  = data.cloudflare_zones.terrible_systems.zones[0].id
  name     = "terrible.systems"
  value    = "in1-smtp.messagingengine.com"
  priority = 10
  type     = "MX"
  ttl      = 1
}

resource "cloudflare_record" "builds-terrible-systems-MX" {
  zone_id  = data.cloudflare_zones.terrible_systems.zones[0].id
  name     = "builds"
  value    = "in1-smtp.messagingengine.com"
  priority = 10
  type     = "MX"
  ttl      = 1
}

resource "cloudflare_record" "f-terrible-systems-CNAME" {
  zone_id = data.cloudflare_zones.terrible_systems.zones[0].id
  name    = "f"
  value   = "d33bpx43z5gzmt.cloudfront.net"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www-dani-builds-terrible-systems-CNAME" {
  zone_id = data.cloudflare_zones.terrible_systems.zones[0].id
  name    = "www.dani.builds"
  value   = "stupefied-beaver-85c4a0.netlify.com"
  type    = "CNAME"
  ttl     = 120
  proxied = false
}

resource "cloudflare_record" "dani-builds-terrible-systems-CNAME" {
  zone_id = data.cloudflare_zones.terrible_systems.zones[0].id
  name    = "dani.builds"
  value   = "stupefied-beaver-85c4a0.netlify.com"
  type    = "CNAME"
  ttl     = 120
  proxied = false
}

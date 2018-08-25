resource "cloudflare_record" "dokku-2gb-lon1-01-terrible-systems-A" {
  domain  = "terrible.systems"
  name    = "dokku-2gb-lon1-01"
  value   = "139.59.200.225"
  type    = "A"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "whereami-dokku-2gb-lon1-01-terrible-systems-A" {
  domain  = "terrible.systems"
  name    = "whereami.dokku-2gb-lon1-01"
  value   = "139.59.200.225"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "jump-terrible-systems-A" {
  domain  = "terrible.systems"
  name    = "jump"
  value   = "207.154.213.220"
  type    = "A"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "terrible-systems-MX" {
  domain   = "terrible.systems"
  name     = "terrible.systems"
  value    = "in1-smtp.messagingengine.com"
  priority = 10
  type     = "MX"
  ttl      = 1
}

resource "cloudflare_record" "builds-terrible-systems-MX" {
  domain   = "terrible.systems"
  name     = "builds"
  value    = "in1-smtp.messagingengine.com"
  priority = 10
  type     = "MX"
  ttl      = 1
}

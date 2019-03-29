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
  value   = "${scaleway_ip.jumphost.ip}"
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

resource "cloudflare_record" "f-terrible-systems-CNAME" {
  domain  = "terrible.systems"
  name    = "f"
  value   = "d33bpx43z5gzmt.cloudfront.net"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www-dani-builds-terrible-systems-CNAME" {
  domain  = "terrible.systems"
  name    = "www.dani.builds"
  value   = "stupefied-beaver-85c4a0.netlify.com"
  type    = "CNAME"
  ttl     = 120
  proxied = false
}

resource "cloudflare_record" "dani-builds-terrible-systems-CNAME" {
  domain  = "terrible.systems"
  name    = "dani.builds"
  value   = "stupefied-beaver-85c4a0.netlify.com"
  type    = "CNAME"
  ttl     = 120
  proxied = false
}

resource "cloudflare_record" "www-dantoml-com-CNAME" {
  domain  = "dantoml.com"
  name    = "www"
  value   = "stupefied-beaver-85c4a0.netlify.com"
  type    = "CNAME"
  ttl     = 120
  proxied = false
}

resource "cloudflare_record" "dantoml-com-CNAME" {
  domain  = "dantoml.com"
  name    = "dantoml.com"
  value   = "stupefied-beaver-85c4a0.netlify.com"
  type    = "CNAME"
  ttl     = 120
  proxied = false
}

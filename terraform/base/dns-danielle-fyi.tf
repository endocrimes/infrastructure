resource "dnsimple_zone_record" "recipies-danielle-fyi-A" {
  zone_name = "danielle.fyi"
  name    = "recipies"
  value   = "65.108.68.203"
  type    = "A"
  ttl     = 60
}

resource "dnsimple_zone_record" "recipes-danielle-fyi-A" {
  zone_name = "danielle.fyi"
  name    = "recipes"
  value   = "65.108.68.203"
  type    = "A"
  ttl     = 60
}

resource "dnsimple_zone_record" "danielle-fyi-A" {
  for_each = toset([
    "198.49.23.145",
    "198.49.23.144",
    "198.185.159.145",
    "198.185.159.144",
  ])

  zone_name = "danielle.fyi"
  name    = ""
  value   = each.value
  type    = "A"
  ttl     = 60
}

resource "dnsimple_zone_record" "danielle-fyi-squarespace-CNAME" {
  zone_name = "danielle.fyi"
  name      = "n3js5b2ef6lsp7la2dh5"
  value     = "verify.squarespace.com"
  type      = "CNAME"
  ttl       = 3600
}

resource "dnsimple_zone_record" "www-danielle-fyi-CNAME" {
  zone_name = "danielle.fyi"
  name      = "www"
  value     = "ext-cust.squarespace.com"
  type      = "CNAME"
  ttl       = 3600
}

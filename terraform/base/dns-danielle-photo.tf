resource "dnsimple_zone_record" "danielle-photo-A" {
  for_each = toset([
    "198.49.23.145",
    "198.49.23.144",
    "198.185.159.145",
    "198.185.159.144",
  ])

  zone_name = "danielle.photo"
  name      = ""
  value     = each.value
  type      = "A"
  ttl       = 60
}

resource "dnsimple_zone_record" "danielle-photo-squarespace-CNAME" {
  zone_name = "danielle.photo"
  name      = "2tj7dlcs3g6mcnmt2flz"
  value     = "verify.squarespace.com"
  type      = "CNAME"
  ttl       = 3600
}

resource "dnsimple_zone_record" "www-danielle-photo-CNAME" {
  zone_name = "danielle.photo"
  name      = "www"
  value     = "ext-cust.squarespace.com"
  type      = "CNAME"
  ttl       = 3600
}


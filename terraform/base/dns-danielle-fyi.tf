resource "dnsimple_zone_record" "www-danielle-fyi-CNAME" {
  zone_name = "danielle.fyi"
  name      = "www."
  value     = "danielle-lancashire.ghost.io"
  type      = "CNAME"
  ttl       = 3600
}

resource "dnsimple_zone_record" "danielle-fyi-A" {
  zone_name = "danielle.fyi"
  name      = "@"
  value     = "178.128.137.126"
  type      = "A"
  ttl       = 3600
}


resource "dnsimple_zone_record" "recipies-danielle-fyi-A" {
  zone_name = "danielle.fyi"
  name      = "recipies"
  value     = "65.108.68.203"
  type      = "A"
  ttl       = 60
}

resource "dnsimple_zone_record" "recipes-danielle-fyi-A" {
  zone_name = "danielle.fyi"
  name      = "recipes"
  value     = "65.108.68.203"
  type      = "A"
  ttl       = 60
}

resource "dnsimple_zone_record" "turso-danielle-fyi-A" {
  zone_name = "danielle.fyi"
  name      = "turso"
  value     = "65.108.68.203"
  type      = "A"
  ttl       = 60
}

resource "dnsimple_zone_record" "hello-civo-danielle-fyi-A" {
  zone_name = "danielle.fyi"
  name      = "hello-civo"
  value     = "a7a43f9a-c0f6-4a44-ab97-f35b2217a96e.k8s.civo.com"
  type      = "CNAME"
  ttl       = 60
}



resource "dnsimple_zone_record" "micro-danielle-fyi-A" {
  for_each = toset([
    "104.200.22.214",
  ])

  zone_name = "danielle.fyi"
  name      = "micro"
  value     = each.value
  type      = "A"
  ttl       = 60
}

resource "dnsimple_zone_record" "links-danielle-fyi-A" {
  for_each = toset(local.ns1_nameservers)

  zone_name = "danielle.fyi"
  name      = "links"
  value     = each.value
  type      = "NS"
  ttl       = 3600
}

resource "dnsimple_zone_record" "atproto-danielle-fyi-TXT" {
  zone_name = "danielle.fyi"
  name      = "_atproto"
  value     = "did=did:plc:ah6drwds5srb4lx33ihfrpk3"
  type      = "TXT"
  ttl       = 3600
}

resource "dnsimple_zone_record" "www-dani-builds-terrible-systems-CNAME" {
  zone_name = "terrible.systems"
  name      = "www.dani.builds"
  value     = "danielle-lancashire.ghost.io"
  type      = "CNAME"
  ttl       = 3600
}

resource "dnsimple_zone_record" "dani-builds-terrible-systems-CNAME" {
  zone_name = "terrible.systems"
  name      = "dani.builds"
  value     = "danielle-lancashire.ghost.io"
  type      = "CNAME"
  ttl       = 3600
}

resource "dnsimple_zone_record" "nixcache-infra-terrible-systems-CNAME" {
  zone_name = "terrible.systems"
  name      = "nixcache.infra"
  value     = "home.hormonal.party"
  type      = "CNAME"
  ttl       = 3600
}

resource "dnsimple_zone_record" "social-terrible-systems-CNAME" {
  zone_name = "terrible.systems"
  name      = "social"
  value     = "vip.masto.host"
  type      = "CNAME"
  ttl       = 3600
}

resource "dnsimple_zone_record" "socially-terrible-systems-CNAME" {
  zone_name = "terrible.systems"
  name      = "socially"
  value     = "vip.masto.host"
  type      = "CNAME"
  ttl       = 3600
}

resource "dnsimple_zone_record" "plex-terrible-systems-CNAME" {
  zone_name = "terrible.systems"
  name      = "plex"
  value     = "home.hormonal.party"
  type      = "CNAME"
  ttl       = 3600
}

resource "dnsimple_zone_record" "terrible-systems-MX" {
  zone_name = "terrible.systems"
  name      = "terrible.systems"
  value     = "in1-smtp.messagingengine.com"
  priority  = 10
  type      = "MX"
  ttl       = 3600
}

resource "dnsimple_zone_record" "builds-terrible-systems-MX" {
  zone_name = "terrible.systems"
  name      = "builds"
  value     = "in1-smtp.messagingengine.com"
  priority  = 10
  type      = "MX"
  ttl       = 3600
}

locals {
  dkim_records = [
    { key = "fm1._domainkey.builds", value = "fm1.builds.terrible.systems.dkim.fmhosted.com" },
    { key = "fm2._domainkey.builds", value = "fm2.builds.terrible.systems.dkim.fmhosted.com" },
    { key = "fm3._domainkey.builds", value = "fm3.builds.terrible.systems.dkim.fmhosted.com" },
    { key = "fm1._domainkey", value = "fm1.terrible.systems.dkim.fmhosted.com" },
    { key = "fm2._domainkey", value = "fm2.terrible.systems.dkim.fmhosted.com" },
    { key = "fm3._domainkey", value = "fm3.terrible.systems.dkim.fmhosted.com" },
  ]
}

resource "dnsimple_zone_record" "terrible-systems-dkim-CNAME" {
  for_each = { for record in local.dkim_records : record.key => record }

  zone_name = "terrible.systems"
  name      = each.value.key
  value     = each.value.value
  type      = "CNAME"
  ttl       = 3600
}


resource "dnsimple_zone_record" "terrible-systems-spf-TXT" {
  zone_name = "terrible.systems"
  name      = "terrible.systems"
  value     = "v=spf1 include:spf.messagingengine.com ?all"
  type      = "TXT"
  ttl       = 3600
}

resource "dnsimple_zone_record" "builds-terrible-systems-spf-TXT" {
  zone_name = "terrible.systems"
  name      = "builds"
  value     = "v=spf1 include:spf.messagingengine.com ?all"
  type      = "TXT"
  ttl       = 3600
}

locals {
  ns1_nameservers = [
    "dns1.p05.nsone.net",
    "dns2.p05.nsone.net",
    "dns3.p05.nsone.net",
    "dns4.p05.nsone.net",
  ]
}

resource "dnsimple_zone_record" "fermyhacks-terrible-systems-NS" {
  for_each = { for record in local.ns1_nameservers : record => record }

  zone_name = "terrible.systems"
  name      = "fermyhacks"
  value     = each.key
  type      = "NS"
  ttl       = 3600
}

resource "dnsimple_zone_record" "todo-terrible-systems-NS" {
  for_each = { for record in local.ns1_nameservers : record => record }

  zone_name = "terrible.systems"
  name      = "todo"
  value     = each.key
  type      = "NS"
  ttl       = 3600
}

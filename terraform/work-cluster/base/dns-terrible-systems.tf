data "cloudflare_zones" "terrible_systems" {
  filter {
    name   = "terrible.systems"
    status = "active"
    paused = false
  }
}

resource "google_dns_managed_zone" "public-zone" {
  name        = "public-zone"
  dns_name    = "gcp01.work.terrible.systems."
  description = "Managed Zone for workcluster"
  visibility  = "public"
}

resource "cloudflare_record" "gcp01-work-terrible-systems-A" {
  // FIXME: horrible hack: assume we have at least 2 nameservers. We can't
  //        for_each right now because we don't _know_ how many during first
  //        apply.
  count = 2

  zone_id = data.cloudflare_zones.terrible_systems.zones[0].id
  name    = "gcp01.work"
  value   = google_dns_managed_zone.public-zone.name_servers[count.index]
  type    = "NS"
  ttl     = 1
  proxied = false
}


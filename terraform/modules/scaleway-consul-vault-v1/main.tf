resource "scaleway_server" "server" {
  count               = "${var.server_count}"
  name                = "cluster-server-${count.index + 1}"
  image               = "${var.image}"
  type                = "${var.type}"
  dynamic_ip_required = true
  tags                = ["vault-server", "nomad-server", "consul-server"]

  bootscript = <<BASH
  METADATA_URL=http://169.254.42.42/conf
  PRIVATE_IP=$(curl --silent $METADATA_URL | grep PRIVATE_IP | sed "s/^[^=]*=//;s/^['\"]//;s/['\"]$//)

  tee /etc/consul.d/consul.conf <<EOF
  FLAGS=-ui \
    -data-dir=/opt/consul/data \
    -node "${server.name}"\
    -datacenter "scaleway-1" \
    -bootstrap-expect ${var.server_count} \
    -retry-join "provider=scaleway organization=${var.scaleway_org} tag_name=consul-server token=${var.server_discovery_token} region=ams1"
  CONSUL_HTTP_ADDR=http://127.0.0.1:8500
  EOF
BASH

  security_group = "${var.security_group}"
}

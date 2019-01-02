resource "scaleway_ip" "jumphost" {
  server = "${scaleway_server.jumphost.id}"
}

resource "scaleway_server" "jumphost" {
  name  = "jumphost"
  image = "a4a83e5b-4660-45e1-ae0b-b606085892ac"
  type  = "START1-S"

  security_group = "${scaleway_security_group.ssh.id}"
}

resource "scaleway_security_group" "ssh" {
  name                    = "ssh"
  description             = "allow port 22 and 443 traffic"
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"
}

resource "scaleway_security_group_rule" "https_accept" {
  security_group = "${scaleway_security_group.ssh.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 443
}

resource "scaleway_security_group_rule" "ssh_accept" {
  security_group = "${scaleway_security_group.ssh.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 22
}

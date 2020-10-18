resource "scaleway_ip" "jumphost" {
  server = scaleway_instance_server.jumphost.id
}

resource "scaleway_instance_server" "jumphost" {
  name  = "jumphost"
  image = "a4a83e5b-4660-45e1-ae0b-b606085892ac"
  type  = "START1-S"

  security_group_id = scaleway_security_group.ssh.id
  enable_ipv6       = true
  cloud_init        = <<EOT
#!/usr/bin/env bash
sleep 5
docker stop sshb0t || true
sleep 5
pkill -9 dockerd
curl -fsSL https://github.com/endocrimes.keys ~/.ssh/authorized_keys
  EOT
}

resource "scaleway_security_group" "ssh" {
  name                    = "ssh"
  description             = "allow port 22 and 443 traffic"
  inbound_default_policy  = "accept" # TODO: Fix this so that outbound traffic works, while denying inbound.
  outbound_default_policy = "accept"
}

resource "scaleway_security_group_rule" "https_accept" {
  security_group = scaleway_security_group.ssh.id

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 443
}

resource "scaleway_security_group_rule" "stream_accept" {
  security_group = scaleway_security_group.ssh.id

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 1443
}

resource "scaleway_security_group_rule" "ssh_accept" {
  security_group = scaleway_security_group.ssh.id

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 22
}

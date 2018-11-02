# Basic config
data_dir = "/opt/nomad"

log_level = "DEBUG"

enable_debug = true

bind_addr = "0.0.0.0"

disable_update_check = true

# Ensure agents leave the cluster gracefully on SIGINT/SIGTERM. If an agent
# does not leave gracefully the cluster state needs to be cleaned up via
# https://www.nomadproject.io/docs/commands/server-force-leave.html before the
# agent can rejoin.
leave_on_interrupt = false

leave_on_terminate = true

# Advertise an accessible IP address so the server is reachable by other servers
# and clients. The IPs can be materialized by Terraform or be replaced by an
# init script.
advertise {
  http = "{{ GetPrivateIP }}:4646"
  rpc  = "{{ GetPrivateIP }}:4647"
  serf = "{{ GetPrivateIP }}:4648"
}

datacenter = "{{datacenter}}"

region = "{{region}}"

tls {
  http                   = false
  rpc                    = true
  verify_server_hostname = false
  ca_file                = "/etc/ssl/nomad/ca.pem"
  cert_file              = "/etc/ssl/nomad/agent.pem"
  key_file               = "/etc/ssl/nomad/agent.key"
}

consul {
  server_service_name = "{{server_service_name}}"
}

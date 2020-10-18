resource "scaleway_k8s_cluster_beta" "dev" {
  name             = "dev"
  description      = "my development cluster"
  version          = "1.19.0"
  cni              = "cilium"
  enable_dashboard = true
  ingress          = "traefik2"

  autoscaler_config {
    disable_scale_down              = false
    scale_down_delay_after_add      = "5m"
    estimator                       = "binpacking"
    expander                        = "random"
    ignore_daemonsets_utilization   = true
    balance_similar_node_groups     = true
    expendable_pods_priority_cutoff = -5
  }
}

resource "scaleway_k8s_pool_beta" "dev" {
  cluster_id  = scaleway_k8s_cluster_beta.dev.id
  name        = "dev"
  node_type   = "DEV1-M"
  size        = 1
  autoscaling = true
  autohealing = true
  min_size    = 1
  max_size    = 3
}

resource "local_file" "dev_kubeconfig" {
  filename          = "output/devcluster.kubeconfig"
  sensitive_content = scaleway_k8s_cluster_beta.dev.kubeconfig.config_file
  file_permission   = "0600"
}

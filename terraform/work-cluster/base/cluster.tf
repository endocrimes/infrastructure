
resource "google_container_cluster" "primary" {
  name     = "work-cluster"
  location = "europe-west3"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  autoscaling_profile = "OPTIMIZE_UTILIZATION"

  workload_identity_config {
    workload_pool = "${data.google_project.project.project_id}.svc.id.goog"
  }

  release_channel {
    channel = "RAPID"
  }
}

resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Kubernetes NodePool Service Account"
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name_prefix = "wrk-prempt"
  location    = "europe-west3"
  cluster     = google_container_cluster.primary.name
  node_count  = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 6
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  upgrade_settings {
    max_surge       = 1
    max_unavailable = 1
  }

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

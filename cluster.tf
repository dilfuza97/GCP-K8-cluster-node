module "primary-cluster" {
  name               = "my-cluster"
  source             = "russmedia/kubernetes-cluster/google"
  version            = "2.0.0"
  region             = "us-east1"
  zones              = "us-east1-c"
  project            = "linux-classs"
  environment        = "Dev"
  min_master_version = "1.11.8"

  #node_pools             = ""

  node_pools = [
    {
      name               = "default-pool"
      initial_node_count = 2
      min_node_count     = 2
      max_node_count     = 3
      version            = "1.11.8-gke.4"
      image_type         = "COS"
      machine_type       = "n1-highmem-4"
      preemptible        = true
      tags               = "Hello"
    },
  ]
}

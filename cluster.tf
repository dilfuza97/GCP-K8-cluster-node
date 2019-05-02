module "primary-cluster" {
  name                                 = "my-cluster"
  source                               = "russmedia/kubernetes-cluster/google"
  version                              = "2.0.0"
  region                               = "us-east1"
  zones                                = ["us-east4-b"]
  project                              = "linux-classs"
  environment                          = "Dev"
  min_master_version                   = "1.11.8"
  network                              = "default"
  nodes_subnet_ip_cidr_range           = "10.101.0.0/24"
  nodes_subnet_container_ip_cidr_range = "172.21.0.0/16"
  nodes_subnet_service_ip_cidr_range   = "10.201.0.0/16"

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

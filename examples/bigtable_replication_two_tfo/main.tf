module "replication_two_test" {
  source = "../../modules/bigtable_replication_two_tfo"

  instanceid    = 0
  clusterid     = ""
  cluster_count = 1
  num_nodes     = 6

  servertype    = "cdp"

  # pass through
  env        = "poc"
  project    = "pcln-pl-devops-poc"
  region     = "us-east4"
  rep_region = "northamerica-northeast1"
}

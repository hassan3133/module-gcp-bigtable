module "test_replication_two_autoscaling" {
  source = "git::https://github.com/pcln/terraform-gcp-bigtable.git//modules/bigtable_replication_two_autoscaling_tfo"

  instanceid    = 0
  clusterid     = ""
  min_nodes     = 1
  max_nodes     = 2
  cpu_target    = 50

  servertype = "test"

  env        = "poc"
  project    = "pcln-pl-devops-poc"
  region     = "us-east4"
  rep_region = "northamerica-northeast1"
}

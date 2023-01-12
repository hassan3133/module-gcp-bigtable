module "test_bigtable_advanced_autoscaling" {
  source = "git::https://github.com/pcln/terraform-gcp-bigtable.git//modules/bigtable_advanced_autoscaling_tfo"

  instance_name = "bigtable-adv-test"

  clusters = {
    "test1" = {
      server_type  = "test-01",
      region       = "us-east4",
      zone         = "a",
      storage_type = "HDD"
      min_nodes    = "1"
      max_nodes    = "3"
      cpu_target   = "50"
    },
    "test2" = {
      server_type  = "test-02",
      region       = "us-east4",
      zone         = "b",
      storage_type = "HDD"
      min_nodes    = "1"
      max_nodes    = "3"
      cpu_target   = "50"
    }
  }

  project = "pcln-pl-devops-poc"
}

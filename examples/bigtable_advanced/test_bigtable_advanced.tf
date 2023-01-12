module "bigtable_advanced_test" {
  source = "../../modules/bigtable_advanced_tfo"

  instance_name = "bigtable-advrep"

  clusters = {
    "test1" = {
      server_type  = "test-01",
      region       = "us-east4",
      zone         = "a",
      storage_type = "SSD"
      num_nodes    = "1"
    },
    "test2" = {
      server_type  = "test-02",
      region       = "northamerica-northeast1"
      zone         = "b",
      storage_type = "SSD"
      num_nodes    = "1"
    }
  }

  env     = "poc"
  project = "pcln-pl-devops-poc"
  region  = "us-east4"
}

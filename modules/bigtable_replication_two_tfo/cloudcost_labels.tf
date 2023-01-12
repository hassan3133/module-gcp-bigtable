module "cloudcost_labels" {
  source = "git::https://github.com/pcln/terraform-curl-cloudcost_labels.git//modules/cloudcost_labels"

  team = var.team
}

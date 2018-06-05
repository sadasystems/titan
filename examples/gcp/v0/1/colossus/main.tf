# Colossus Example for GCP

provider "google" {
  project = "${var.project_name}"
  region = "${var.region}"
}

data "google_compute_zones" "available" {}

variable "project_name" {}
variable "region" { default = "us-east1" }

module "network" {
  source = "../../../../../modules/gcp/v0/1/colossus_network"

  id = "0"
  domain = "gcp.mycompany.com"
  name = "development"
  name_short = "dev"
  name_fancy = "Development"
  # up to 2Gbit/s unidirectional per core, n1-standard-1 is one core
  nat_instance_type = "n1-standard-1"
  # run two NAT gateways per AZ rather than one
  nat_zonal_high_availability = true
}

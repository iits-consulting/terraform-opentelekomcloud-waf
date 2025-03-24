terraform {
  required_version = ">= 1.5.7"
  required_providers {
    opentelekomcloud = {
      source  = "opentelekomcloud/opentelekomcloud"
      version = "~> 1.31"
    }
    errorcheck = {
      source  = "iits-consulting/errorcheck"
      version = "3.0.3"
    }
  }
}

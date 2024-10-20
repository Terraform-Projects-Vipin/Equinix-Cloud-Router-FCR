provider "equinix" {

  client_id     = var.ecx_client_id
  client_secret = var.ecx_client_secret
}

resource "random_pet" "this" {
  length = 2
}

resource "equinix_fabric_cloud_router" "this" {
  name = random_pet.this.id
  type = var.type
  notifications {
    type   = "ALL"
    emails = [var.emails]
  }
  order {
    purchase_order_number = var.purchase_order_number
  }
  location {
    metro_code = var.metro_code
  }
  package {
    code = var.code
  }
  project {
    project_id = var.project_id
  }
  account {
    account_number = var.account_number
  }
}


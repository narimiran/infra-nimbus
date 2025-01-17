module "nimbus_log_store" {
  source = "github.com/status-im/infra-tf-dummy-module"

  name   = "store"
  env    = "logs"
  stage  = "nimbus"
  group  = "logs.nimbus"
  region = "eu-hel1"
  prefix = "he"
  domain = var.domain

  ips = [
    "65.108.129.55",
    "65.108.129.56",
    "65.108.129.57",
  ]
}

resource "cloudflare_record" "nimbus_log_store" {
  zone_id = local.zones["status.im"]
  name    = "nimbus-es.infra"
  value   = "proxy.infra.status.im"
  type    = "CNAME"
  proxied = false
}

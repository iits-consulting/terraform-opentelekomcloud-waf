## Create Web Application Firewall for a Domain

Usage Example:

```hcl
module "certificate" {
  source                  = "iits-consulting/acme/opentelekomcloud"
  cert_registration_email = "certificates@domain.com"
  otc_domain_name         = var.otc_domain_name
  otc_project_name        = var.project_name
  domains = {
    "domain.com" = ["*.domain.com"]
  }
}

module "waf" {
  source                  = "iits-consulting/waf/opentelekomcloud"
  dns_zone_id             = var.dns_zone.id
  domain                  = "subdomain.domain.com"
  certificate             = module.acme_certificate.certificate["domain.com"].certificate
  certificate_private_key = module.acme_certificate.certificate["domain.com"].private_key
  server_addresses = [
    "${var.public_ip}:443",
  ]
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                                          | Version  |
| --------------------------------------------------------------------------------------------- | -------- |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement_opentelekomcloud) | >=1.31.5 |

## Providers

| Name                                                                                    | Version  |
| --------------------------------------------------------------------------------------- | -------- |
| <a name="provider_errorcheck"></a> [errorcheck](#provider_errorcheck)                   | n/a      |
| <a name="provider_opentelekomcloud"></a> [opentelekomcloud](#provider_opentelekomcloud) | >=1.31.5 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                  | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [errorcheck_is_valid.certificate_private_key_required](https://registry.terraform.io/providers/iits-consulting/errorcheck/latest/docs/resources/is_valid)             | resource |
| [errorcheck_is_valid.certificate_private_key_validation](https://registry.terraform.io/providers/iits-consulting/errorcheck/latest/docs/resources/is_valid)           | resource |
| [errorcheck_is_valid.certificate_required](https://registry.terraform.io/providers/iits-consulting/errorcheck/latest/docs/resources/is_valid)                         | resource |
| [errorcheck_is_valid.certificate_validation](https://registry.terraform.io/providers/iits-consulting/errorcheck/latest/docs/resources/is_valid)                       | resource |
| [opentelekomcloud_dns_recordset_v2.waf](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/dns_recordset_v2)             | resource |
| [opentelekomcloud_waf_certificate_v1.certificate](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/waf_certificate_v1) | resource |
| [opentelekomcloud_waf_domain_v1.domain](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/waf_domain_v1)                | resource |

## Inputs

| Name                                                                                                   | Description                                                                                                                    | Type          | Default      | Required |
| ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------ | ------------- | ------------ | :------: |
| <a name="input_dns_zone_id"></a> [dns_zone_id](#input_dns_zone_id)                                     | OTC DNS zone to create the WAF CNAME records in.                                                                               | `string`      | n/a          |   yes    |
| <a name="input_domain"></a> [domain](#input_domain)                                                    | Domain name to create DNS and WAF resources for.                                                                               | `string`      | n/a          |   yes    |
| <a name="input_server_addresses"></a> [server_addresses](#input_server_addresses)                      | Set of destination endpoint(s) external IP address(es) and ports they are listening on in format <ip_addr>:<port>              | `set(string)` | n/a          |   yes    |
| <a name="input_certificate"></a> [certificate](#input_certificate)                                     | Signed certificate in PEM format for the domain(s).                                                                            | `string`      | `""`         |    no    |
| <a name="input_certificate_private_key"></a> [certificate_private_key](#input_certificate_private_key) | Private key of the certificate in PEM format for the domain(s).                                                                | `string`      | `""`         |    no    |
| <a name="input_client_insecure"></a> [client_insecure](#input_client_insecure)                         | Use HTTP (insecure) protocol between WAF and client. (default: false).                                                         | `bool`        | `false`      |    no    |
| <a name="input_server_insecure"></a> [server_insecure](#input_server_insecure)                         | Use HTTP (insecure) protocol between WAF and destination endpoint(s). (default: false).                                        | `bool`        | `false`      |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                          | Common tag set for PEGA project resources                                                                                      | `map(string)` | `{}`         |    no    |
| <a name="input_tls_cipher"></a> [tls_cipher](#input_tls_cipher)                                        | Cipher suite to use with TLS. Accepted values are "cipher_default", "cipher_1", "cipher_2" and "cipher_3". (default: cipher_1) | `string`      | `"cipher_1"` |    no    |
| <a name="input_tls_version"></a> [tls_version](#input_tls_version)                                     | TLS version to enforce on client. Accepted values are "TLS v1.1" and "TLS v1.2". (default: TLS v1.2)                           | `string`      | `"TLS v1.2"` |    no    |
| <a name="input_waf_policy_id"></a> [waf_policy_id](#input_waf_policy_id)                               | WAF policy ID to associate with the domains. (default: OTC will create a default policy)                                       | `string`      | `null`       |    no    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->

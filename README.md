# terraform-google-dns

Terraform module that manages a [Google Cloud](https://cloud.google.com/)
Cloud DNS managed zone (`google_dns_managed_zone`) and an optional set of
record sets driven by a map input.

## Usage

```hcl
module "dns" {
  source = "github.com/cybercapybara/terraform-google-dns"

  project_id = var.project_id
  name       = "prod-zone"
  dns_name   = "example.com."

  records = {
    www = {
      name    = "www.example.com."
      type    = "A"
      ttl     = 300
      rrdatas = ["203.0.113.10"]
    }
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| google    | >= 5.0   |

## Inputs

| Name          | Description                                                   | Type          | Default                  | Required |
|---------------|---------------------------------------------------------------|---------------|--------------------------|:--------:|
| `project_id`  | ID of the project in which to create the managed zone.        | `string`      | n/a                      |   yes    |
| `name`        | Name of the managed DNS zone.                                 | `string`      | n/a                      |   yes    |
| `dns_name`    | DNS name of the zone, with a trailing dot.                    | `string`      | n/a                      |   yes    |
| `description` | Description for the managed zone.                             | `string`      | `"Managed by Terraform"` |    no    |
| `visibility`  | Zone visibility: public or private.                          | `string`      | `"public"`               |    no    |
| `records`     | DNS records keyed by id (name, type, ttl, rrdatas).          | `map(object)` | `{}`                     |    no    |
| `labels`      | Labels applied to the managed zone.                          | `map(string)` | `{}`                     |    no    |

## Outputs

| Name           | Description                                    |
|----------------|------------------------------------------------|
| `id`           | Identifier of the managed zone.               |
| `name`         | Name of the managed zone.                     |
| `name_servers` | Name servers delegated to this managed zone.  |

## License

[MIT](LICENSE)

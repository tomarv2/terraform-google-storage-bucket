<p align="center">
    <a href="https://github.com/tomarv2/terraform-google-storage-bucket/actions/workflows/pre-commit.yml" alt="Pre Commit">
        <img src="https://github.com/tomarv2/terraform-google-storage-bucket/actions/workflows/pre-commit.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-google-storage-bucket" /></a>
    <a href="https://github.com/tomarv2/terraform-google-storage-bucket/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-storage-bucket" /></a>
    <a href="https://github.com/tomarv2/terraform-google-storage-bucket/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-google-storage-bucket" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

## Terraform module for Google Storage Bucket

> :arrow_right:  Terraform module for [AWS S3](https://registry.terraform.io/modules/tomarv2/s3/aws/latest)

> :arrow_right:  Terraform module for [Azure Storage Account](https://registry.terraform.io/modules/tomarv2/storage-account/azure/latest)


### Versions

- Module tested for Terraform 1.0.1.
- GCP provider version [4.12.0](https://registry.terraform.io/providers/hashicorp/google/latest).
- `main` branch: Provider versions not pinned to keep up with Terraform releases.
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-google-storage-bucket/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-storage-bucket" /></a>).

### Usage

#### Option 1:

```
terrafrom init
terraform plan -var='teamid=tryme' -var='prjid=project1'
terraform apply -var='teamid=tryme' -var='prjid=project1'
terraform destroy -var='teamid=tryme' -var='prjid=project1'
```
**Note:** With this option please take care of remote state storage

#### Option 2:

##### Recommended method (stores remote state in remote backend(S3,  Azure storage, or Google bucket) using `prjid` and `teamid` to create directory structure):

- Create python 3.8+ virtual environment
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote --upgrade
```

- Set below environment variables:
```
export TF_GCLOUD_BUCKET=<remote state bucket name>
export TF_GCLOUD_PREFIX=<remote state bucket prefix>
export TF_GCLOUD_CREDENTIALS=<gcp credentials.json>
```

- Updated `examples` directory with required values.

- Run and verify the output before deploying:
```
tf -c=gcloud plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:
```
tf -c=gcloud apply -var='teamid=foo' -var='prjid=bar'
```

- Run below to destroy:
```
tf -c=gcloud destroy -var='teamid=foo' -var='prjid=bar'
```

**Note:** Read more on [tfremote](https://github.com/tomarv2/tfremote)
##### Storage bucket
```
terraform {
  required_version = ">= 1.0.1"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.12.0"
    }
  }
}

provider "google" {
  region  = var.region
  project = var.project
}

module "storage_bucket" {
  source = "../../"

  uniform_bucket_level_access = true
  versioning                  = false
  enable_website              = true  # NOTE: enable_website and enable_cors go togeather
  enable_cors                 = false # enable_cors is dependent on enable_website
  # -----------------------------------
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.12.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.12.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [random_string.naming](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/string) | resource |
| [google_compute_regions.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_regions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Google storage bucket name | `string` | `null` | no |
| <a name="input_cors_extra_headers"></a> [cors\_extra\_headers](#input\_cors\_extra\_headers) | List of HTTP headers other than the simple response headers to give permission for the user-agent to share across domains | `list(string)` | `[]` | no |
| <a name="input_cors_max_age_seconds"></a> [cors\_max\_age\_seconds](#input\_cors\_max\_age\_seconds) | The value, in seconds, to return in the Access-Control-Max-Age header used in preflight responses | `number` | `600` | no |
| <a name="input_cors_methods"></a> [cors\_methods](#input\_cors\_methods) | list of HTTP methods on which to include CORS response headers, (GET, OPTIONS, POST, etc). Note: '*' is permitted in the list of methods, and means 'any method' | `list(string)` | `[]` | no |
| <a name="input_cors_origins"></a> [cors\_origins](#input\_cors\_origins) | List of Origins eligible to receive CORS response headers. Note: '*' is permitted in the list of origins, and means 'any Origin' | `list(string)` | `[]` | no |
| <a name="input_custom_labels"></a> [custom\_labels](#input\_custom\_labels) | Extra custom labels | `any` | `null` | no |
| <a name="input_deploy_bucket"></a> [deploy\_bucket](#input\_deploy\_bucket) | Feature flag, true or false | `bool` | `true` | no |
| <a name="input_enable_cors"></a> [enable\_cors](#input\_enable\_cors) | Set to true if you want to enable CORS headers | `bool` | `false` | no |
| <a name="input_enable_website"></a> [enable\_website](#input\_enable\_website) | Set to true if you want to enable CORS headers | `bool` | `false` | no |
| <a name="input_encryption"></a> [encryption](#input\_encryption) | A Cloud KMS key that will be used to encrypt objects inserted into this bucket | <pre>object({<br>    default_kms_key_name = string<br>  })</pre> | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run. | `bool` | `false` | no |
| <a name="input_index_page"></a> [index\_page](#input\_index\_page) | Bucket's directory index | `string` | `"index.html"` | no |
| <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region) | Location where this resources should be created | `string` | `null` | no |
| <a name="input_not_found_page"></a> [not\_found\_page](#input\_not\_found\_page) | The custom object to return when a requested resource is not found | `string` | `"404.html"` | no |
| <a name="input_prjid"></a> [prjid](#input\_prjid) | Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_retention_policy"></a> [retention\_policy](#input\_retention\_policy) | Configuration of the bucket's data retention policy for how long objects in the bucket should be retained. | <pre>object({<br>    is_locked        = bool<br>    retention_period = number<br>  })</pre> | `null` | no |
| <a name="input_teamid"></a> [teamid](#input\_teamid) | Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_uniform_bucket_level_access"></a> [uniform\_bucket\_level\_access](#input\_uniform\_bucket\_level\_access) | Enables Uniform bucket-level access access to a bucket. | `bool` | `true` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Versioning should be enabled or disabled on bucket | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_bucket_id"></a> [storage\_bucket\_id](#output\_storage\_bucket\_id) | Storage bucket id |
| <a name="output_storage_bucket_location"></a> [storage\_bucket\_location](#output\_storage\_bucket\_location) | Storage bucket location |
| <a name="output_storage_bucket_name"></a> [storage\_bucket\_name](#output\_storage\_bucket\_name) | Storage bucket name |
| <a name="output_storage_bucket_storage_class"></a> [storage\_bucket\_storage\_class](#output\_storage\_bucket\_storage\_class) | Storage bucket class |
| <a name="output_storage_bucket_url"></a> [storage\_bucket\_url](#output\_storage\_bucket\_url) | Storage bucket url |
| <a name="output_storage_bucket_website"></a> [storage\_bucket\_website](#output\_storage\_bucket\_website) | URL of the website |
<!-- END_TF_DOCS -->

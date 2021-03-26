<p align="center">
    <a href="https://github.com/tomarv2/terraform-google-storage-bucket/actions/workflows/security_scans.yml" alt="Security Scans">
        <img src="https://github.com/tomarv2/terraform-google-storage-bucket/actions/workflows/security_scans.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-google-storage-bucket" /></a>
    <a href="https://github.com/tomarv2/terraform-google-storage-bucket/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-storage-bucket" /></a>
    <a href="https://github.com/tomarv2/terraform-google-storage-bucket/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-google-storage-bucket" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://discord.gg/XH975bzN" alt="chat on Discord">
        <img src="https://img.shields.io/discord/813961944443912223?logo=discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

# Terraform module to create Google Storage Bucket

> :arrow_right:  Terraform module for [AWS S3](https://registry.terraform.io/modules/tomarv2/s3/aws/latest)

> :arrow_right:  Terraform module for [Azure Storage Account](https://registry.terraform.io/modules/tomarv2/storage-account/azure/latest)


# Versions

- Module tested for Terraform 0.14.
- Google provider version [3.58.0](https://registry.terraform.io/providers/hashicorp/google/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-google-storage-bucket/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-storage-bucket" /></a> in your releases)

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Usage

Recommended method:

- Create python 3.6+ virtual environment 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_GCLOUD_BUCKET=<remote state bucket name>
export TF_GCLOUD_CREDENTIALS=<gcp credentials.json>
```  

- Make required change to `examples` directory.

- Run and verify the output before deploying:
```
tf -cloud gcloud plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:
```
tf -cloud gcloud apply -var='teamid=foo' -var='prjid=bar'
```

- Run below to destroy:
```
tf -cloud gcloud destroy -var='teamid=foo' -var='prjid=bar'
```

> ❗️ **Important** - Two variables are required for using `tf` package:
>
> - teamid
> - prjid
>
> These variables are required to set backend path in the remote storage.
> Variables can be defined using:
>
> - As `inline variables` e.g.: `-var='teamid=demo-team' -var='prjid=demo-project'`
> - Inside `.tfvars` file e.g.: `-var-file=<tfvars file location> `
>
> For more information refer to [Terraform documentation](https://www.terraform.io/docs/language/values/variables.html)

##### Storage Bucket(with optional enable website)
```
module "storage_bucket" {
  source = "../"

  deploy_bucket = true

  gcp_project                 = "demo-1000"
  uniform_bucket_level_access = true
  versioning                  = false
  enable_website              = false # NOTE: enable_website and enable_cors go togeather
  enable_cors                 = false  # enable_cors is dependent on enable_website
  # -----------------------------------
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| google | ~> 3.60 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.60 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | Google storage bucket name | `any` | `null` | no |
| cors\_extra\_headers | List of HTTP headers other than the simple response headers to give permission for the user-agent to share across domains | `list(string)` | `[]` | no |
| cors\_max\_age\_seconds | The value, in seconds, to return in the Access-Control-Max-Age header used in preflight responses | `number` | `600` | no |
| cors\_methods | list of HTTP methods on which to include CORS response headers, (GET, OPTIONS, POST, etc). Note: '\*' is permitted in the list of methods, and means 'any method' | `list(string)` | `[]` | no |
| cors\_origins | List of Origins eligible to receive CORS response headers. Note: '\*' is permitted in the list of origins, and means 'any Origin' | `list(string)` | `[]` | no |
| deploy\_bucket | feature flag, true or false | `bool` | `true` | no |
| enable\_cors | Set to true if you want to enable CORS headers | `bool` | `false` | no |
| enable\_website | Set to true if you want to enable CORS headers | `bool` | `false` | no |
| encryption | A Cloud KMS key that will be used to encrypt objects inserted into this bucket | <pre>object({<br>    default_kms_key_name = string<br>  })</pre> | `null` | no |
| force\_destroy | When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run. | `bool` | `false` | no |
| gcp\_project | The ID of the project to create the bucket in. | `any` | n/a | yes |
| gcp\_region | Location where this resources should be created | `string` | `"us-central1"` | no |
| index\_page | Bucket's directory index | `string` | `"index.html"` | no |
| not\_found\_page | The custom object to return when a requested resource is not found | `string` | `"404.html"` | no |
| prjid | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| retention\_policy | Configuration of the bucket's data retention policy for how long objects in the bucket should be retained. | <pre>object({<br>    is_locked        = bool<br>    retention_period = number<br>  })</pre> | `null` | no |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| uniform\_bucket\_level\_access | Enables Uniform bucket-level access access to a bucket. | `bool` | `true` | no |
| versioning | Versioning should be enabled or disabled on bucket | `bool` | `false` | no |
| website | Map of website values. Supported attributes: main\_page\_suffix, not\_found\_page | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| storage\_bucket\_id | Storage bucket id |
| storage\_bucket\_location | Storage bucket location |
| storage\_bucket\_name | Storage bucket name |
| storage\_bucket\_storage\_class | Storage bucket class |
| storage\_bucket\_url | Storage bucket url |
| storage\_bucket\_website | URL of the website |

## Permissions

Service account with the following roles is required:

- [`roles/storage.admin`](https://cloud.google.com/iam/docs/understanding-roles#cloud-storage-roles)

## Project APIs

Following APIs must be enabled on the project:
- `storage-api.googleapis.com`

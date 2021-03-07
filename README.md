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

# Versions

- Module tested for Terraform 0.14.
- Google provider version [3.58.0](https://registry.terraform.io/providers/hashicorp/google/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use latest     
        <a href="https://github.com/tomarv2/terraform-google-storage-bucket/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-storage-bucket" /></a> 
  in your releases)

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
export TF_GCLOUD_PREFIX=<remote state bucket prefix>
export TF_GCLOUD_CREDENTIALS=<gcp credentials.json>
export TF_GCLOUD_CREDENTIALS=<gcp credentials.json>
```  

- Make required change to: 
```
examples directory
```

- Run and verify the output before deploying:
```
tf -cloud gcloud plan -var-file <path to .tfvars file>
```

- Run below to deploy:
```
tf -cloud gcloud apply -var-file <path to .tfvars file>
```

- Run below to destroy:
```
tf -cloud gcloud destroy -var-file <path to .tfvars file>
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


```
module "storage_bucket" {
  source                      = "../"
  gcp_project                 = "demo-1000"
  uniform_bucket_level_access = true
  # ------------------------------------------------
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| google | ~> 3.58 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.58 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| force\_destroy | When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run. | `bool` | `false` | no |
| gcp\_project | Name of the GCP project | `any` | n/a | yes |
| gcp\_region | n/a | `string` | `"us-central1"` | no |
| prjid | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| uniform\_bucket\_level\_access | Enables Uniform bucket-level access access to a bucket. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| storage\_bucket\_id | Storage bucket id |
| storage\_bucket\_location | Storage bucket location |
| storage\_bucket\_name | Storage bucket name |
| storage\_bucket\_url | Storage bucket url |

## Permissions

Service account with the following roles is required:

- [`roles/storage.admin`](https://cloud.google.com/iam/docs/understanding-roles#cloud-storage-roles)

## Project APIs

Following APIs must be enabled on the project:
- `storage-api.googleapis.com`

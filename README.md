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

# Terraform module to create Google Storage Bucket

> :arrow_right:  Terraform module for [AWS S3](https://registry.terraform.io/modules/tomarv2/s3/aws/latest)

> :arrow_right:  Terraform module for [Azure Storage Account](https://registry.terraform.io/modules/tomarv2/storage-account/azure/latest)


## Versions

- Module tested for Terraform 1.0.1.
- GCP provider version [4.11.0](https://registry.terraform.io/providers/hashicorp/google/latest).
- `main` branch: Provider versions not pinned to keep up with Terraform releases.
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-google-storage-bucket/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-storage-bucket" /></a>).


## Usage

### Option 1:

```
terrafrom init
terraform plan -var='teamid=tryme' -var='prjid=project1'
terraform apply -var='teamid=tryme' -var='prjid=project1'
terraform destroy -var='teamid=tryme' -var='prjid=project1'
```
**Note:** With this option please take care of remote state storage

### Option 2:

#### Recommended method (stores remote state in S3 using `prjid` and `teamid` to create directory structure):

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

**NOTE:**

- Read more on [tfremote](https://github.com/tomarv2/tfremote)
---

### Virtual Machine
```
module "storage-bucket" {
  source = "git::git@github.com:tomarv2/terraform-google-storage-bucket.git"

  # --------------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

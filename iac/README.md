# Website infrastructure

Terraform manages a public Cloud Storage bucket in the existing
`personal-website-512218` project. The default bucket name is
`personal-website-512218-website`, located in Paris (`EUROPE-WEST9`).
Override variables with `-var` or a `.tfvars` file if needed.
Bucket names are globally unique, including across projects.

## Create the bucket

Install Terraform >= 1.9 and the Google Cloud CLI. Authenticate both the CLI
(for uploads) and Application Default Credentials (for Terraform):

```sh
gcloud auth login
gcloud auth application-default login
terraform -chdir=iac init
terraform -chdir=iac plan -out=website.tfplan
terraform -chdir=iac apply website.tfplan
```

Run these commands from the repository root. The project must have the Cloud
Storage API enabled and your account needs permission to create buckets and
set bucket IAM (for example, Storage Admin). An organization policy enforcing
public access prevention or restricting public IAM members must allow this
public website; `inherited` does not override organization policies.

The `allUsers` binding grants object read and list access, not write access.
Only public website assets belong in this bucket.
Terraform refuses to delete a nonempty bucket (`force_destroy = false`).

State is stored locally in `iac/terraform.tfstate` and ignored by Git. Keep it
safe between runs. For team or CI Terraform usage, configure a separate,
private remote state bucket; never store state in the public website bucket.
Commit `.terraform.lock.hcl` to keep provider versions consistent.

## Upload the website

After applying Terraform:

```sh
make deploy
terraform -chdir=iac output -raw index_url
```

The deploy script reads the bucket URI from Terraform state and synchronizes
`public_html/`. It does not change IAM or website configuration. Remote files
that have been removed locally are retained.

The index URL is a direct HTTPS object URL for a smoke check. Cloud Storage
object URLs do not provide the same index/error routing as website endpoints.
Serving `https://pierre-alexandre.io` requires a separate HTTPS frontend
(such as a Google Cloud external Application Load Balancer with a certificate)
and DNS configuration. These are not provisioned here.

For the existing GitHub deployment workflow, update `GCP_PROJECT_ID` and
`GCP_SERVICE_ACCOUNT_KEY` secrets for this project and set the repository
variable `WEBSITE_BUCKET_URI` to the `bucket_uri` Terraform output. The script
uses that variable when provided, so CI uploads do not require Terraform state.
The deployment identity needs object management permissions on this bucket.

See [Google's static website hosting guide](https://docs.cloud.google.com/storage/docs/hosting-static-website).

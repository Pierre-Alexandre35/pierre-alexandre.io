#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

bucket_uri="${WEBSITE_BUCKET_URI:-$(terraform -chdir=iac output -raw bucket_uri)}"
gcloud storage rsync public_html "$bucket_uri" --recursive

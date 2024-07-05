#!/bin/bash

set -e

# Input variables
REPO_NAME=$1
IS_PRIVATE=$2
ACCESS_TOKEN=$3

# Create the repository
response=$(curl -X POST \
  -H "Authorization: token $ACCESS_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/user/repos \
  -d "{\"name\":\"$REPO_NAME\",\"private\":$IS_PRIVATE}")

repo_url=$(echo $response | jq -r '.html_url')

echo $repo_url

echo "::set-output name=repo_url::$repo_url"
#echo "repo_url=$repo_url" >> $GITHUB_OUTPUT

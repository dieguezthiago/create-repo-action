# Create New Repository GitHub Action

This GitHub Action automates the process of creating a new repository within the user's GitHub account. It allows you to specify the repository name, privacy setting, and Personal Access Token (PAT) for authentication.

## Inputs

### `repo_name` (required)

The name of the new repository to be created.

### `is_private` (required)

Defines if the new repository should be private (`true`) or public (`false`).

### `personal_access_token` (required)

GitHub Personal Access Token with the necessary scopes to create repositories. This should be kept secure and not hard-coded directly in workflows.

## Outputs

### `repo_url`

The URL of the newly created repository.

## Example Usage

```yaml
name: Create New Repository

on:
  workflow_dispatch:

jobs:
  create-repo:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Create new repository
        id: create_repo
        uses: ThiagoDieguez/create-repo-action@v1
        with:
          repo_name: 'new-repo'
          is_private: 'true'
          personal_access_token: ${{ secrets.PERSONAL_ACCESS_TOKEN }}
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      - name: Get the URL of the newly created repository
        run: echo "Repository URL: ${{ steps.create_repo.outputs.repo_url }}"

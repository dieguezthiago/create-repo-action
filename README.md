# Create New Repository GitHub Action

This GitHub Action automates the process of creating a new repository within the user's GitHub account. It allows you to specify the repository name and whether the repository should be private or public.

## Inputs

### `repo_name` (required)

The name of the new repository to be created.

### `is_private` (required)

Defines if the new repository should be private (`true`) or public (`false`).

## Secrets

### `PERSONAL_ACCESS_TOKEN` (required)

GitHub Personal Access Token with the following scopes:
- `repo`: Required to create repositories.

Make sure to create a Personal Access Token with the `repo` scope enabled and store it as a secret in your repository.

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
        uses: dieguezthiago/create-repo-action@v1
        with:
          repo_name: 'new-repo'
          is_private: 'true'
        env:
          PERSONAL_ACCESS_TOKEN: ${{ secrets.PERSONAL_ACCESS_TOKEN }}

      - name: Get the URL of the newly created repository
        run: echo "Repository URL: ${{ steps.create_repo.outputs.repo_url }}"

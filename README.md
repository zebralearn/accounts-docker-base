# accounts-docker-base

Base PHP runtime image for Zebralearn accounts services.

## What's in this image

This image is built from Alpine + PHP 8.2 CLI and includes:

- Core tools: `bash`, `ca-certificates`, `tini`, `postgresql-client`
- PHP extensions: `swoole`, `redis`, `rdkafka`, `pdo_mysql`, `pdo_pgsql`, `pcntl`, `bcmath`, `gd`, `zip`, `intl`, `opcache`, `exif`

## Repository Files

- `Dockerfile` - Base runtime image definition
- `docker-compose.yml` - Local build/run helper
- `.github/workflows/docker-publish.yml` - CI workflow to build and push to GHCR

## Local usage

### Build with Docker

```bash
docker build -t ghcr.io/zebralearn/accounts-docker-base:local .
```

### Run a quick check

```bash
docker run --rm ghcr.io/zebralearn/accounts-docker-base:local php -v
```

### Build and run with Docker Compose

```bash
docker compose up --build
```

The compose service currently runs:

```bash
php -v
```

## GitHub Actions: Build and Publish to GHCR

Workflow file: `.github/workflows/docker-publish.yml`

### Triggers

- Push to `main`
- Push tags matching `v*` (example: `v1.0.0`)
- Manual trigger via `workflow_dispatch`

### Published image

- `ghcr.io/zebralearn/accounts-docker-base`

### Generated tags

- `latest` (default branch only)
- Branch name tags
- Git tag name tags
- Commit SHA tags

### Required repository settings

1. Actions permissions should allow read/write for packages.
2. The workflow uses `${{ secrets.GITHUB_TOKEN }}` for authentication to GHCR.

## Pull from GHCR

```bash
docker pull ghcr.io/zebralearn/accounts-docker-base:latest
```

## Notes

- Multi-architecture images are built for `linux/amd64` and `linux/arm64`.
- Build cache is enabled through GitHub Actions cache backend.

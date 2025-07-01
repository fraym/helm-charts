# Fraym CRUD Helm Chart

This Helm chart deploys [CRUD](https://docs.freym.becklyn.app/docs/services/crud/introduction), a service for easily creating CRUD APIs for your data.

## Overview

Fraym CRUD provides a simple and efficient way to create CRUD (Create, Read, Update, Delete) APIs for your data, enabling rapid development of data-driven applications.

## Installation

### Add the Helm Repository

```bash
helm repo add fraeym https://fraym.github.io/helm-charts
helm repo update
```

### Install the Chart

```bash
# Install with default values
helm install crud fraeym/crud
```

## Configuration

The following table lists the configurable parameters of the crud chart and their default values.

| Parameter             | Description                                 | Default |
| --------------------- | ------------------------------------------- | ------- |
| `debug`               | Enable debug mode (development environment) | `false` |
| `replicas`            | Number of replicas                          | `2`     |
| `autoscaling.enabled` | Enable horizontal pod autoscaling           | `true`  |
| `postgres.connection` | PostgreSQL connection string                |         |
| `auth.secret`         | Authentication secret key                   |         |

### Resource Configuration

| Parameter                   | Description                    | Default |
| --------------------------- | ------------------------------ | ------- |
| `resources.requests.cpu`    | CPU resource requests          | `500m`  |
| `resources.requests.memory` | Memory resource requests       | `100Mi` |
| `resources.limits.memory`   | Memory resource limits         | `500Mi` |
| `resources.limits.cpu`      | CPU resource limits (optional) |         |

### S3 Configuration

| Parameter            | Description                   | Default |
| -------------------- | ----------------------------- | ------- |
| `s3.accessKeyId`     | S3 access key ID              |         |
| `s3.secretAccessKey` | S3 secret access key          |         |
| `s3.endpoint`        | S3 endpoint URL               |         |
| `s3.ssl`             | Enable SSL for S3 connections | `false` |

### GitHub Configuration

This is used to load the private images from the Fraeym GitHub container registry.

| Parameter         | Description                  | Default |
| ----------------- | ---------------------------- | ------- |
| `github.username` | GitHub username for registry |         |
| `github.token`    | GitHub token for registry    |         |

### Imgproxy Configuration

| Parameter                               | Description          | Default |
| --------------------------------------- | -------------------- | ------- |
| `imgproxy.features.aws.s3Endpoint`      | S3 endpoint URL      |         |
| `imgproxy.features.aws.accessKeyId`     | S3 access key ID     |         |
| `imgproxy.features.aws.secretAccessKey` | S3 secret access key |         |

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym CRUD Documentation](https://docs.freym.becklyn.app/docs/services/crud/introduction).

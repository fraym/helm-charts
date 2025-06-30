# Fraym Streams Helm Chart

This Helm chart deploys [Streams](https://docs.freym.becklyn.app/docs/services/streams/introduction), a distributed event sourcing and pub/sub service.

## Overview

Fraym Streams provides distributed event sourcing and publish/subscribe capabilities, enabling reliable event-driven architectures and event streaming.

## Installation

### Add the Helm Repository

```bash
helm repo add fraeym https://fraym.github.io/helm-charts
helm repo update
```

### Install the Chart

```bash
# Install with default values
helm install streams fraeym/streams
```

## Configuration

The following table lists the configurable parameters of the streams chart and their default values.

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
| `resources.requests.cpu`    | CPU resource requests          | `100m`  |
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

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym Streams Documentation](https://docs.freym.becklyn.app/docs/services/streams/introduction).

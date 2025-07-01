# Fraeym Helm Chart

This Helm chart deploys the complete [Fraeym](https://docs.fraym.becklyn.app/) system, a comprehensive platform for building data-driven applications with event sourcing, projections, and real-time capabilities.

## Overview

Fraeym is a complete system that includes multiple services working together:

- **Sync**: Event sourcing and synchronization service
- **Streams**: Real-time event streaming service
- **Projections**: Data projection service
- **CRUD**: CRUD API service for data access
- **Deployments**: Fraeym schema deployment management service
- **Auth**: Authentication and authorization service

## Installation

### Add the Helm Repository

```bash
helm repo add fraeym https://fraym.github.io/helm-charts
helm repo update
```

### Install the Chart

```bash
# Install with default values
helm install fraeym fraeym/fraeym
```

## Configuration

The following table lists the configurable parameters of the fraeym chart and their default values.

| Parameter                    | Description                                 | Default |
| ---------------------------- | ------------------------------------------- | ------- |
| `global.debug`               | Enable debug mode (development environment) | `false` |
| `global.auth.secret`         | Authentication secret key                   |         |
| `global.postgres.connection` | PostgreSQL connection string                |         |

### Service Configuration

Each service can be enabled or disabled individually:

| Parameter             | Description                | Default |
| --------------------- | -------------------------- | ------- |
| `projections.enabled` | Enable projections service | `false` |
| `crud.enabled`        | Enable CRUD service        | `false` |
| `deployments.enabled` | Enable deployments service | `false` |
| `auth.enabled`        | Enable auth service        | `false` |

### Global S3 Configuration

| Parameter                   | Description                   | Default |
| --------------------------- | ----------------------------- | ------- |
| `global.s3.accessKeyId`     | S3 access key ID              |         |
| `global.s3.secretAccessKey` | S3 secret access key          |         |
| `global.s3.endpoint`        | S3 endpoint URL               |         |
| `global.s3.ssl`             | Enable SSL for S3 connections | `false` |

### GitHub Configuration

This is used to load the private images from the Fraeym GitHub container registry.

| Parameter                | Description                  | Default |
| ------------------------ | ---------------------------- | ------- |
| `global.github.username` | GitHub username for registry |         |
| `global.github.token`    | GitHub token for registry    |         |

## Usage

For detailed usage instructions and API documentation, refer to the [Fraeym Documentation](https://docs.fraym.becklyn.app/).

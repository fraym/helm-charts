# Fraym Deployments Helm Chart

This Helm chart deploys [Deployments](https://docs.freym.becklyn.app/docs/services/deployments/introduction), a schema deployment service for Fraym.

## Overview

Fraym Deployments provides schema deployment capabilities for the Fraym platform, enabling reliable deployment and management of Fraeym schemas and configurations.

## Installation

### Add the Helm Repository

```bash
helm repo add fraeym https://fraym.github.io/helm-charts
helm repo update
```

### Install the Chart

```bash
# Install with default values
helm install deployments fraeym/deployments
```

## Configuration

The following table lists the configurable parameters of the deployments chart and their default values.

| Parameter             | Description                                 | Default |
| --------------------- | ------------------------------------------- | ------- |
| `debug`               | Enable debug mode (development environment) | `false` |
| `postgres.connection` | PostgreSQL connection string                |         |
| `apiToken`            | Deployments Api Token                       |         |

### Resource Configuration

| Parameter                   | Description                    | Default |
| --------------------------- | ------------------------------ | ------- |
| `resources.requests.cpu`    | CPU resource requests          | `10m`   |
| `resources.requests.memory` | Memory resource requests       | `50Mi`  |
| `resources.limits.memory`   | Memory resource limits         | `500Mi` |
| `resources.limits.cpu`      | CPU resource limits (optional) |         |

## Usage

This is used to load the private images from the Fraeym GitHub container registry.

| Parameter         | Description                  | Default |
| ----------------- | ---------------------------- | ------- |
| `github.username` | GitHub username for registry |         |
| `github.token`    | GitHub token for registry    |         |

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym Deployments Documentation](https://docs.freym.becklyn.app/docs/services/deployments/introduction).

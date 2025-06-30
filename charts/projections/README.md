# Fraym Projections Helm Chart

This Helm chart deploys [Projections](https://docs.freym.becklyn.app/docs/services/projections/introduction), a distributed projections service for event sourced applications.

## Overview

Fraym Projections provides distributed projection capabilities for event sourced applications, enabling efficient read models and data transformations from event streams.

## Installation

### Add the Helm Repository

```bash
helm repo add fraeym https://fraym.github.io/helm-charts
helm repo update
```

### Install the Chart

```bash
# Install with default values
helm install projections fraeym/projections
```

## Configuration

The following table lists the configurable parameters of the projections chart and their default values.

| Parameter             | Description                                 | Default |
| --------------------- | ------------------------------------------- | ------- |
| `debug`               | Enable debug mode (development environment) | `false` |
| `replicas`            | Number of replicas                          | `2`     |
| `autoscaling.enabled` | Enable horizontal pod autoscaling           | `true`  |
| `postgres.connection` | PostgreSQL connection string                |         |
| `auth.secret`         | Authentication secret key                   |         |

### Resource Configuration

| Parameter                   | Description                    | Default  |
| --------------------------- | ------------------------------ | -------- |
| `resources.requests.cpu`    | CPU resource requests          | `300m`   |
| `resources.requests.memory` | Memory resource requests       | `150Mi`  |
| `resources.limits.memory`   | Memory resource limits         | `1500Mi` |
| `resources.limits.cpu`      | CPU resource limits (optional) |          |

### GitHub Configuration

This is used to load the private images from the Fraeym GitHub container registry.

| Parameter         | Description                  | Default |
| ----------------- | ---------------------------- | ------- |
| `github.username` | GitHub username for registry |         |
| `github.token`    | GitHub token for registry    |         |

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym Projections Documentation](https://docs.freym.becklyn.app/docs/services/projections/introduction).

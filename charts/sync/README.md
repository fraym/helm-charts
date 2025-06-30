# Fraym Sync Helm Chart

This Helm chart deploys [Sync](https://docs.freym.becklyn.app/docs/services/sync/introduction), a locking service for distributed systems.

## Overview

Fraym Sync provides locking capabilities for distributed services, ensuring data consistency and preventing race conditions in distributed systems.

## Installation

### Add the Helm Repository

```bash
helm repo add fraeym https://fraym.github.io/helm-charts
helm repo update
```

### Install the Chart

```bash
# Install with default values
helm install sync fraeym/sync
```

## Configuration

The following table lists the configurable parameters of the sync chart and their default values.

| Parameter                   | Description                                 | Default |
| --------------------------- | ------------------------------------------- | ------- |
| `debug`                     | Enable debug mode (development environment) | `false` |
| `resources.requests.cpu`    | CPU resource requests                       | `100m`  |
| `resources.requests.memory` | Memory resource requests                    | `50Mi`  |
| `resources.limits.memory`   | Memory resource limits                      | `500Mi` |
| `resources.limits.cpu`      | CPU resource limits (optional)              |         |

### GitHub Configuration

This is used to load the private images from the Fraeym GitHub container registry.

| Parameter         | Description                  | Default |
| ----------------- | ---------------------------- | ------- |
| `github.username` | GitHub username for registry |         |
| `github.token`    | GitHub token for registry    |         |

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym Sync Documentation](https://docs.freym.becklyn.app/docs/services/sync/introduction).

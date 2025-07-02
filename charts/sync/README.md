# Fraym Sync Helm Chart

This Helm chart deploys [Sync](https://docs.freym.becklyn.app/docs/services/sync/introduction), a locking service for distributed systems.

## Overview

Fraym Sync provides locking capabilities for distributed services, ensuring data consistency and preventing race conditions in distributed systems.

## Installation

### Private Image Registry Configuration

The docker image is pulled from the Fraeym GitHub container registry.

Please follow this documentation on how to add the docker credentials to your cluster:
[Pull an Image from a Private Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)

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

| Parameter | Description                                 | Default |
| --------- | ------------------------------------------- | ------- |
| `debug`   | Enable debug mode (development environment) | `false` |

### Resource Configuration

| Parameter                   | Description                    | Default |
| --------------------------- | ------------------------------ | ------- |
| `resources.requests.cpu`    | CPU resource requests          | `100m`  |
| `resources.requests.memory` | Memory resource requests       | `50Mi` |
| `resources.limits.memory`   | Memory resource limits         | `500Mi` |
| `resources.limits.cpu`      | CPU resource limits (optional) |         |
## Usage

For detailed usage instructions and API documentation, refer to the [Fraym Sync Documentation](https://docs.freym.becklyn.app/docs/services/sync/introduction).

# Fraym Auth Helm Chart

This Helm chart deploys [Auth](https://docs.freym.becklyn.app/docs/services/auth/introduction), an authentication and authorization service.

## Overview

Fraym Auth provides authentication and authorization capabilities, enabling secure access control and user management for your applications.

## Installation

### Add the Helm Repository

```bash
helm repo add fraeym https://fraym.github.io/helm-charts
helm repo update
```

### Install the Chart

```bash
# Install with default values
helm install auth fraeym/auth
```

## Configuration

The following table lists the configurable parameters of the auth chart and their default values.

| Parameter               | Description                                 | Default |
| ----------------------- | ------------------------------------------- | ------- |
| `debug`                 | Enable debug mode (development environment) | `false` |
| `replicas`              | Number of replicas                          | `2`     |
| `autoscaling.enabled`   | Enable horizontal pod autoscaling           | `true`  |
| `initialPasswordSecret` | Initial password secret key                 |         |
| `secret`                | Authentication secret key                   |         |

### Resource Configuration

| Parameter                   | Description                    | Default |
| --------------------------- | ------------------------------ | ------- |
| `resources.requests.cpu`    | CPU resource requests          | `100m`  |
| `resources.requests.memory` | Memory resource requests       | `100Mi` |
| `resources.limits.memory`   | Memory resource limits         | `500Mi` |
| `resources.limits.cpu`      | CPU resource limits (optional) |         |

### GitHub Configuration

This is used to load the private images from the Fraeym GitHub container registry.

| Parameter         | Description                  | Default |
| ----------------- | ---------------------------- | ------- |
| `github.username` | GitHub username for registry |         |
| `github.token`    | GitHub token for registry    |         |

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym Auth Documentation](https://docs.freym.becklyn.app/docs/services/auth/introduction).

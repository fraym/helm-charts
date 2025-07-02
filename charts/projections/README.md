# Fraym Projections Helm Chart

This Helm chart deploys [Projections](https://docs.freym.becklyn.app/docs/services/projections/introduction), a distributed projections service for event sourced applications.

## Overview

Fraym Projections provides distributed projection capabilities for event sourced applications, enabling efficient read models and data transformations from event streams.

## Installation

### Private Image Registry Configuration

The docker image is pulled from the Fraeym GitHub container registry.

Please follow this documentation on how to add the docker credentials to your cluster:
[Pull an Image from a Private Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)

### Required secrets

The following secrets are required. Please add them to your cluster before installing the chart.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: fraeym-auth-config
  namespace: {{ .Release.Namespace }}
data:
  AUTH_SECRET: {{ .Values.auth.secret | b64enc }}
---
apiVersion: v1
kind: Secret
metadata:
  name: fraeym-postgres-config
  namespace: {{ .Release.Namespace }}
data:
  POSTGRES_CONNECTION: {{ .Values.postgres.connection | b64enc }}
```

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

### Resource Configuration

| Parameter                   | Description                    | Default  |
| --------------------------- | ------------------------------ | -------- |
| `resources.requests.cpu`    | CPU resource requests          | `300m`   |
| `resources.requests.memory` | Memory resource requests       | `150Mi`  |
| `resources.limits.memory`   | Memory resource limits         | `1500Mi` |
| `resources.limits.cpu`      | CPU resource limits (optional) |          |

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym Projections Documentation](https://docs.freym.becklyn.app/docs/services/projections/introduction).

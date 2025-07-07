# Fraym Deployments Helm Chart

This Helm chart deploys [Deployments](https://docs.freym.becklyn.app/docs/services/deployments/introduction), a schema deployment service for Fraym.

## Overview

Fraym Deployments provides schema deployment capabilities for the Fraym platform, enabling reliable deployment and management of Fraeym schemas and configurations.

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
  name: fraeym-deployments-config
  namespace: {{ .Release.Namespace }}
data:
  API_TOKEN: {{ .Values.apiToken | b64enc }}
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
helm install deployments fraeym/deployments
```

## Configuration

The following table lists the configurable parameters of the deployments chart and their default values.

| Parameter | Description                                 | Default       |
| --------- | ------------------------------------------- | ------------- |
| `debug`   | Enable debug mode (development environment) | `false`       |
| `appEnv`  | Application environment                     | `development` |

### Resource Configuration

| Parameter                   | Description                    | Default |
| --------------------------- | ------------------------------ | ------- |
| `resources.requests.cpu`    | CPU resource requests          | `10m`   |
| `resources.requests.memory` | Memory resource requests       | `50Mi`  |
| `resources.limits.memory`   | Memory resource limits         | `500Mi` |
| `resources.limits.cpu`      | CPU resource limits (optional) |         |

### Secret Configuration

| Parameter                | Description                    | Default                     |
| ------------------------ | ------------------------------ | --------------------------- |
| `secretName.deployments` | Name of the deployments secret | `fraeym-deployments-config` |
| `secretName.postgres`    | Name of the postgres secret    | `fraeym-postgres-config`    |

#### Auth secret example

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: fraeym-deployments-config
data:
  API_TOKEN: {{ .Values.deployments.apiToken | b64enc }}
```

#### Postgres secret example

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: fraeym-postgres-config
data:
  POSTGRES_CONNECTION: {{ .Values.postgres.connection | b64enc }}
```

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym Deployments Documentation](https://docs.freym.becklyn.app/docs/services/deployments/introduction).

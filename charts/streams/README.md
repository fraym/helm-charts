# Fraym Streams Helm Chart

This Helm chart deploys [Streams](https://docs.freym.becklyn.app/docs/services/streams/introduction), a distributed event sourcing and pub/sub service.

## Overview

Fraym Streams provides distributed event sourcing and publish/subscribe capabilities, enabling reliable event-driven architectures and event streaming.

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

### Required Cluster Role

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: fraeym-wait-for-pods
rules:
  - apiGroups: [""]
    resources: ["pods", "services", "deployments"]
    verbs: ["get", "list", "watch"]
```

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

| Parameter             | Description                                 | Default       |
| --------------------- | ------------------------------------------- | ------------- |
| `debug`               | Enable debug mode (development environment) | `false`       |
| `replicas`            | Number of replicas                          | `2`           |
| `autoscaling.enabled` | Enable horizontal pod autoscaling           | `true`        |
| `appEnv`              | Application environment                     | `development` |

### Resource Configuration

| Parameter                   | Description                    | Default |
| --------------------------- | ------------------------------ | ------- |
| `resources.requests.cpu`    | CPU resource requests          | `100m`  |
| `resources.requests.memory` | Memory resource requests       | `100Mi` |
| `resources.limits.memory`   | Memory resource limits         | `500Mi` |
| `resources.limits.cpu`      | CPU resource limits (optional) |         |

### Secret Configuration

You can configure the name of the secrets by setting the `secretName` object.

| Parameter             | Description                 | Default                  |
| --------------------- | --------------------------- | ------------------------ |
| `secretName.auth`     | Name of the auth secret     | `fraeym-auth-config`     |
| `secretName.postgres` | Name of the postgres secret | `fraeym-postgres-config` |

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym Streams Documentation](https://docs.freym.becklyn.app/docs/services/streams/introduction).

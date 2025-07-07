# Fraym Auth Helm Chart

This Helm chart deploys [Auth](https://docs.freym.becklyn.app/docs/services/auth/introduction), an authentication and authorization service.

## Overview

Fraym Auth provides authentication and authorization capabilities, enabling secure access control and user management for your applications.

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
  AUTH_SECRET_INITIAL_PW: {{ .Values.initialPasswordSecret | b64enc }}
```
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

| Parameter               | Description                                 | Default       |
| ----------------------- | ------------------------------------------- | -------------|
| `debug`                 | Enable debug mode (development environment) | `false`       |
| `replicas`              | Number of replicas                          | `2`           |
| `autoscaling.enabled`   | Enable horizontal pod autoscaling           | `true`        |
| `initialPasswordSecret` | Initial password secret key                 |               |
| `secret`                | Authentication secret key                   |               |
| `appEnv`                | Application environment                     | `development` |

### Resource Configuration

| Parameter                   | Description                    | Default |
| --------------------------- | ------------------------------ | ------- |
| `resources.requests.cpu`    | CPU resource requests          | `100m`  |
| `resources.requests.memory` | Memory resource requests       | `100Mi` |
| `resources.limits.memory`   | Memory resource limits         | `500Mi` |
| `resources.limits.cpu`      | CPU resource limits (optional) |         |

### Secret Configuration

You can configure the name of the secret by setting the `secretName` object.

| Parameter             | Description                 | Default                  |
| --------------------- | --------------------------- | ------------------------ |
| `secretName.auth`     | Name of the auth secret     | `fraeym-auth-config`     |

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym Auth Documentation](https://docs.freym.becklyn.app/docs/services/auth/introduction).

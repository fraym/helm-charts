# Fraym CRUD Helm Chart

This Helm chart deploys [CRUD](https://docs.freym.becklyn.app/docs/services/crud/introduction), a service for easily creating CRUD APIs for your data.

## Overview

Fraym CRUD provides a simple and efficient way to create CRUD (Create, Read, Update, Delete) APIs for your data, enabling rapid development of data-driven applications.

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
---
apiVersion: v1
kind: Secret
metadata:
  name: fraeym-s3-config
  namespace: {{ .Release.Namespace }}
data:
  S3_ACCESS_KEY: {{ .Values.s3.accessKeyId | b64enc }}
  S3_SECRET_KEY: {{ .Values.s3.secretAccessKey | b64enc }}
```

### Add the Helm Repository

```bash
helm repo add fraeym https://fraym.github.io/helm-charts
helm repo update
```

### Install the Chart

```bash
# Install with default values
helm install crud fraeym/crud
```

## Configuration

The following table lists the configurable parameters of the crud chart and their default values.

| Parameter             | Description                                 | Default       |
| --------------------- | ------------------------------------------- | ------------- |
| `debug`               | Enable debug mode (development environment) | `false`       |
| `replicas`            | Number of replicas                          | `2`           |
| `autoscaling.enabled` | Enable horizontal pod autoscaling           | `true`        |
| `appEnv`              | Application environment                     | `development` |

### Resource Configuration

| Parameter                   | Description                    | Default |
| --------------------------- | ------------------------------ | ------- |
| `resources.requests.cpu`    | CPU resource requests          | `500m`  |
| `resources.requests.memory` | Memory resource requests       | `100Mi` |
| `resources.limits.memory`   | Memory resource limits         | `500Mi` |
| `resources.limits.cpu`      | CPU resource limits (optional) |         |

### S3 Configuration

| Parameter     | Description                   | Default |
| ------------- | ----------------------------- | ------- |
| `s3.endpoint` | S3 endpoint URL               |         |
| `s3.ssl`      | Enable SSL for S3 connections | `false` |

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym CRUD Documentation](https://docs.freym.becklyn.app/docs/services/crud/introduction).

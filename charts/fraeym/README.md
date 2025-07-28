# Fraym Helm Chart

This Helm chart deploys [Fraeym](https://docs.freym.becklyn.app/docs).

## Overview

All Fraeym services are deployed with this chart.

## Installation

### Postgres

You need to have a postgres instance running. Please be aware that the user that Fraeym uses needs permissions to create databases.
Do not use a pooler in front of Fraeym. This might lead to unexpected behavior (caching of connections while creating a new database).

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
  name: fraeym-deployments-config
  namespace: {{ .Release.Namespace }}
data:
  API_TOKEN: {{ .Values.apiToken | b64enc }}
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
helm install projections fraeym/fraeym
```

## Configuration

The following table lists the configurable parameters of the fraeym chart and their default values.

| Parameter              | Description                                 | Default       |
| ---------------------- | ------------------------------------------- | ------------- |
| `sync.create`          | Enable sync service                         | `true`        |
| `sync.debug`           | Enable debug mode (development environment) | `false`       |
| `sync.appEnv`          | Application environment                     | `development` |
| `streams.create`       | Enable streams service                      | `true`        |
| `streams.debug`        | Enable debug mode (development environment) | `false`       |
| `streams.appEnv`       | Application environment                     | `development` |
| `streams.replicas`     | Number of replicas                          | `2`           |
| `projections.create`   | Enable projections service                  | `true`        |
| `projections.debug`    | Enable debug mode (development environment) | `false`       |
| `projections.appEnv`   | Application environment                     | `development` |
| `projections.replicas` | Number of replicas                          | `2`           |
| `deployments.create`   | Enable deployments service                  | `true`        |
| `deployments.debug`    | Enable debug mode (development environment) | `false`       |
| `deployments.appEnv`   | Application environment                     | `development` |
| `crud.create`          | Enable crud service                         | `true`        |
| `crud.debug`           | Enable debug mode (development environment) | `false`       |
| `crud.appEnv`          | Application environment                     | `development` |
| `crud.replicas`        | Number of replicas                          | `2`           |
| `auth.create`          | Enable auth service                         | `true`        |
| `auth.debug`           | Enable debug mode (development environment) | `false`       |
| `auth.appEnv`          | Application environment                     | `development` |
| `auth.replicas`        | Number of replicas                          | `2`           |

### S3 Configuration

| Parameter          | Description                   | Default |
| ------------------ | ----------------------------- | ------- |
| `crud.s3.bucket`   | S3 bucket name                |         |
| `crud.s3.endpoint` | S3 endpoint URL               |         |
| `crud.s3.ssl`      | Enable SSL for S3 connections | `false` |

### Resource Configuration

| Parameter                               | Description                    | Default  |
| --------------------------------------- | ------------------------------ | -------- |
| `sync.resources.requests.cpu`           | CPU resource requests          | `100m`   |
| `sync.resources.requests.memory`        | Memory resource requests       | `50Mi`   |
| `sync.resources.limits.memory`          | Memory resource limits         | `500Mi`  |
| `sync.resources.limits.cpu`             | CPU resource limits (optional) |          |
| `streams.resources.requests.cpu`        | CPU resource requests          | `100m`   |
| `streams.resources.requests.memory`     | Memory resource requests       | `100Mi`  |
| `streams.resources.limits.memory`       | Memory resource limits         | `500Mi`  |
| `streams.resources.limits.cpu`          | CPU resource limits (optional) |          |
| `projections.resources.requests.cpu`    | CPU resource requests          | `300m`   |
| `projections.resources.requests.memory` | Memory resource requests       | `150Mi`  |
| `projections.resources.limits.memory`   | Memory resource limits         | `1500Mi` |
| `projections.resources.limits.cpu`      | CPU resource limits (optional) |          |
| `deployments.resources.requests.cpu`    | CPU resource requests          | `10m`    |
| `deployments.resources.requests.memory` | Memory resource requests       | `50Mi`   |
| `deployments.resources.limits.memory`   | Memory resource limits         | `500Mi`  |
| `deployments.resources.limits.cpu`      | CPU resource limits (optional) |          |
| `crud.resources.requests.cpu`           | CPU resource requests          | `500m`   |
| `crud.resources.requests.memory`        | Memory resource requests       | `100Mi`  |
| `crud.resources.limits.memory`          | Memory resource limits         | `500Mi`  |
| `crud.resources.limits.cpu`             | CPU resource limits (optional) |          |
| `auth.resources.requests.cpu`           | CPU resource requests          | `100m`   |
| `auth.resources.requests.memory`        | Memory resource requests       | `100Mi`  |
| `auth.resources.limits.memory`          | Memory resource limits         | `500Mi`  |
| `auth.resources.limits.cpu`             | CPU resource limits (optional) |          |

### Autoscaling Configuration

| Parameter                                                   | Description                          | Default |
| ----------------------------------------------------------- | ------------------------------------ | ------- |
| `streams.autoscaling.enabled`                               | Enable horizontal pod autoscaling    | `true`  |
| `streams.autoscaling.minReplicas`                           | Minimum number of replicas           | `2`     |
| `streams.autoscaling.maxReplicas`                           | Maximum number of replicas           | `10`    |
| `streams.autoscaling.targetCPUUtilizationPercentage`        | Target CPU utilization percentage    | `100`   |
| `streams.autoscaling.targetMemoryUtilizationPercentage`     | Target memory utilization percentage |         |
| `projections.autoscaling.enabled`                           | Enable horizontal pod autoscaling    | `true`  |
| `projections.autoscaling.minReplicas`                       | Minimum number of replicas           | `2`     |
| `projections.autoscaling.maxReplicas`                       | Maximum number of replicas           | `10`    |
| `projections.autoscaling.targetCPUUtilizationPercentage`    | Target CPU utilization percentage    | `100`   |
| `projections.autoscaling.targetMemoryUtilizationPercentage` | Target memory utilization percentage |         |
| `crud.autoscaling.enabled`                                  | Enable horizontal pod autoscaling    | `true`  |
| `crud.autoscaling.minReplicas`                              | Minimum number of replicas           | `2`     |
| `crud.autoscaling.maxReplicas`                              | Maximum number of replicas           | `10`    |
| `crud.autoscaling.targetCPUUtilizationPercentage`           | Target CPU utilization percentage    | `100`   |
| `crud.autoscaling.targetMemoryUtilizationPercentage`        | Target memory utilization percentage |         |
| `auth.autoscaling.enabled`                                  | Enable horizontal pod autoscaling    | `true`  |
| `auth.autoscaling.minReplicas`                              | Minimum number of replicas           | `2`     |
| `auth.autoscaling.maxReplicas`                              | Maximum number of replicas           | `10`    |
| `auth.autoscaling.targetCPUUtilizationPercentage`           | Target CPU utilization percentage    | `100`   |
| `auth.autoscaling.targetMemoryUtilizationPercentage`        | Target memory utilization percentage |         |

### Secret Configuration

You can configure the name of the secrets by setting the `secretName` object.

| Parameter                            | Description                    | Default                     |
| ------------------------------------ | ------------------------------ | --------------------------- |
| `streams.secretName.auth`            | Name of the auth secret        | `fraeym-auth-config`        |
| `streams.secretName.postgres`        | Name of the postgres secret    | `fraeym-postgres-config`    |
| `projections.secretName.auth`        | Name of the auth secret        | `fraeym-auth-config`        |
| `projections.secretName.postgres`    | Name of the postgres secret    | `fraeym-postgres-config`    |
| `deployments.secretName.deployments` | Name of the deployments secret | `fraeym-deployments-config` |
| `deployments.secretName.postgres`    | Name of the postgres secret    | `fraeym-postgres-config`    |
| `crud.secretName.auth`               | Name of the auth secret        | `fraeym-auth-config`        |
| `crud.secretName.postgres`           | Name of the postgres secret    | `fraeym-postgres-config`    |
| `crud.secretName.s3`                 | Name of the s3 secret          | `fraeym-s3-config`          |
| `auth.secretName.auth`               | Name of the auth secret        | `fraeym-auth-config`        |

### Traefik Ingress Configuration

| Parameter                    | Description                 | Default          |
| ---------------------------- | --------------------------- | ---------------- |
| `traefik.ingress.create`     | Enable traefik ingress      | `false`          |
| `traefik.ingress.baseDomain` | Base domain for the ingress | `demo.fraeym.io` |

### Imgproxy Configuration

You can use the full configuration available for the [imgproxy chart](https://github.com/imgproxy/imgproxy-helm). Just prefix every value by `imgproxy`.
Example: `logging.level` becomes `imgproxy.logging.level`.

### Regcred Configuration

This is used to pull the Fraeym images from the GitHub container registry.

| Parameter         | Description     | Default |
| ----------------- | --------------- | ------- |
| `regcred.create`  | Enable regcred  | `false` |
| `github.username` | GitHub username |         |
| `github.token`    | GitHub token    |         |

## Usage

For detailed usage instructions and API documentation, refer to the [Fraym Documentation](https://docs.freym.becklyn.app/docs).

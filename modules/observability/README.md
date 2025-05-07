# Namespace

```
kubectl create namespace monitoring
```

# Observability Module

This module sets up:

- Prometheus (metrics)
- Grafana (dashboards)
- Loki + Promtail (logs)

## Deploy

```bash
terraform apply

Grafana will be accessible via a LoadBalancer service. Login with:

Username: admin

Password: nodeopsdemo!@#$
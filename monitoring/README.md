# Monitoring Setup with Prometheus, Grafana & Node Exporter

## Objective

To implement an open-source monitoring solution for the application/cluster using Prometheus, Grafana, and Node Exporter.

---

## Monitoring Stack

- Prometheus
- Grafana
- Node Exporter
- Docker & Docker Compose

---

## Components

### Prometheus
- Collects metrics from Node Exporter.
- Stores time-series monitoring data.
- Exposes metrics on port **9090**.

### Node Exporter
- Collects system-level metrics from the EC2 instance.
- CPU Usage
- Memory Usage
- Disk Usage
- Network Statistics
- Exposes metrics on port **9100**.

### Grafana
- Visualizes Prometheus metrics.
- Displays CPU and system health dashboards.
- Accessible on port **3001**.

---

## Docker Containers

| Container | Purpose | Port |
|-----------|----------|------|
| Prometheus | Metrics Collection | 9090 |
| Grafana | Monitoring Dashboard | 3001 |
| Node Exporter | System Metrics | 9100 |

---

## Deployment

Start monitoring services:

```bash
cd ~/monitoring
sudo docker compose up -d
```

Verify running containers:

```bash
sudo docker ps
```

Expected Containers:

- prometheus
- grafana
- node-exporter

---

## Verify Prometheus

Open:

```
http://<EC2-PUBLIC-IP>:9090
```

Example Query:

```
node_cpu_seconds_total
```

This confirms Prometheus is successfully collecting Node Exporter metrics.

---

## Verify Grafana

Open:

```
http://<EC2-PUBLIC-IP>:3001
```

Default Login

Username:

```
admin
```

Password:

```
admin
```

(Password changed during first login.)

---

## Prometheus Data Source

Configure Grafana with:

```
URL:
http://prometheus:9090
```

Click:

```
Save & Test
```

Result:

```
Data source is working
```

---

## CPU Monitoring Query

PromQL:

```promql
100 - (avg by(instance)(rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
```

The dashboard displays:

- CPU Utilization
- Real-time System Health
- Live Performance Metrics

---

## Monitoring URLs

Grafana

```
http://<EC2-PUBLIC-IP>:3001
```

Prometheus

```
http://<EC2-PUBLIC-IP>:9090
```

---

## Outcome

Successfully implemented an open-source monitoring solution using Prometheus, Grafana, and Node Exporter.

The monitoring stack provides:

- Real-time CPU monitoring
- System health visualization
- Performance metrics collection
- Grafana dashboard visualization

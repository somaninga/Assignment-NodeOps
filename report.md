Report: Secure High-Availability EVM RPC Cluster

🔐 Security Measures

Network Security

AWS Security Groups & NACLs: Applied principle of least privilege. Only required ports (e.g., 443, 80, 30303) are allowed.

WAF + ModSecurity: Protects RPC endpoints from common web attacks and JSON-RPC specific exploits.

Nginx with Rate Limiting & IP Whitelisting: Prevents abuse, DDoS, and unauthorized access.

Node Hardening

Docker and Kubernetes Hardening: Images scanned and hardened. Minimal privileges granted.

RPC Filtering: JSON-RPC methods like admin_, debug_, etc., are blocked using reverse proxy rules.

TLS Everywhere: TLS termination with cert-manager using Let’s Encrypt ensures encrypted communication.

📈 Observability Setup

Monitoring

Prometheus + Grafana: Metrics collected from EVM nodes, system (node-exporter), and Kubernetes.

Dashboards:

rpc-overview.json: Monitors latency, error rate, and throughput.

node-health.json: Tracks sync status, block height, and peer connections.

system-metrics.json: Reports CPU, memory, and disk usage.

Logging

Loki: Centralized logging for Nginx, EVM nodes, and system logs.

Label-based Alerts:

High latency or 5xx errors from RPC.

Lagging block height (sync issues).

Security alerts for failed login attempts or WAF rule triggers.

⚡ Performance Optimization

Instance Types: m5.xlarge with optimized network performance for handling high request throughput.

Node Settings: Increased cache size and fast sync mode enabled to reduce response latency.

Kernel Tweaks: Applied sysctl tuning for networking, file descriptors, and connection tracking.

⚙️ High Availability Strategy

EKS Auto Healing: Ensures Kubernetes restarts failed pods.

Multiple EVM Nodes: Load-balanced with Nginx, auto-scaled to ensure redundancy.

Zero Downtime Failover: Demonstrated by terminating a pod and verifying uninterrupted RPC availability.

📦 Infrastructure as Code

Terraform Modules: Infrastructure broken into reusable modules (EVM nodes, observability, WAF, etc.).

Automated Bootstrap: Scripts provided to quickly add/remove nodes, simulate attacks, and apply security policies.

This implementation ensures secure, observable, and resilient access to EVM RPC services on AWS, suitable for Web3 workloads.

Prepared by:
Somaninga Pujarisomaningp@gmail.com


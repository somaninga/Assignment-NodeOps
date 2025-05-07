## Assignment: Secure High-Availability EVM RPC Cluster Setup

📌 Overview

This project implements a secure, highly available EVM RPC infrastructure on AWS using EKS (Kubernetes), Terraform, and Helm. The setup ensures fault tolerance, observability, and secure access for RPC endpoints.

🧱 Architecture Diagram



📂 Folder Structure

Assignment-NodeOps/
├── cache/
├── dashboards/
│   ├── node-health.json
│   ├── rpc-overview.json
│   └── system-metrics.json
├── helm-charts/
│   ├── evm-node/
│   ├── nginx/
│   └── prometheus-grafana/
├── scripts/
│   ├── add-node.sh
│   ├── bootstrap.sh
│   └── simulate-attack.sh
├── terraform/
│   ├── modules/
│   │   ├── cert-manager/
│   │   ├── evm-node/
│   │   ├── nginx-lb/
│   │   ├── observability/
│   │   └── waf/
│   ├── alb.tf
│   ├── eks-cluster.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── security-groups.tf
│   ├── variables.tf
│   └── vpc.tf
├── waf/
│   └── modsecurity.conf
├── README.md
├── report.md
└── init-project.sh

⚙️ Technologies Used

AWS (VPC, EKS, ALB, WAF, IAM, EC2)

Terraform (IaC)

Helm (Kubernetes app deployment)

Prometheus + Grafana + Loki (Monitoring & Logging)

Nginx (Load Balancer with Rate Limiting)

Cert-Manager (TLS/SSL management)

🚀 Deployment Instructions

1. Clone the Repository

git clone https://github.com/your-username/Assignment-NodeOps.git
cd Assignment-NodeOps

2. Initialize Terraform

cd terraform
terraform init

3. Review Variables and Apply

Edit terraform/variables.tf and then:

terraform plan
terraform apply

4. Deploy Helm Charts

cd ../helm-charts
helm install evm-node ./evm-node
helm install nginx ./nginx
helm install monitoring ./prometheus-grafana

5. Bootstrap Observability

bash ../scripts/bootstrap.sh

🔐 Security Features

AWS WAFv2 with custom rules and ModSecurity

Nginx with IP whitelisting, rate limiting, and TLS termination

Role-based access for Kubernetes and AWS resources

JSON-RPC filtering to block sensitive methods

Cert-Manager for automatic TLS certificate issuance

📊 Observability Features

Dashboards:

RPC Overview, Node Health, System Metrics

Alerting:

High latency, sync lag, error rates, security violations

Prometheus Exporters:

Node Exporter, Loki, Kube State Metrics

🔄 Automation

add-node.sh and simulate-attack.sh automate scaling and security testing

Modular Terraform for reusable infra components

📝 License

MIT License

📬 Contact

Created by Somaninga Pujari. For questions, contact: somaningp@gmail.com
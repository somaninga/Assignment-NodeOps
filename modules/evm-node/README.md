# EVM Node Deployment Module

This module deploys an Ethereum node (EVM-compatible) using the Helm chart `geth`.

## Requirements
- Terraform
- Helm
- Kubernetes cluster (EKS or other Kubernetes-based cluster)

## Usage

This module will deploy the Ethereum node on your Kubernetes cluster. You can specify the values for various parameters (such as network, verbosity, ports) in the `values.yaml` file.

To deploy the EVM node:

1. Ensure your Kubeconfig is set up correctly.
2. Run the following Terraform commands:

```bash
terraform init
terraform apply

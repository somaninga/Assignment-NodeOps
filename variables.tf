variable "aws_region" {
  description = "AWS region to deploy EKS cluster"
  type        = string
  default     = "us-west-2"
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  type        = string
  default     = "default"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "NodeOps-Assignement-Soma"
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "m5.xlarge"
}

variable "subnet_azs" {
  description = "Availability Zones for subnets"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2d"]
}

variable "desired_capacity" {
  description = "Desired capacity of worker nodes"
  type        = number
  default     = 2
}

variable "min_capacity" {
  description = "Minimum capacity of worker nodes"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Maximum capacity of worker nodes"
  type        = number
  default     = 5
}

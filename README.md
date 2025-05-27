# Cloud Infrastructure Automation with Terraform, Docker, and Ansible

![AWS Terraform Docker Ansible](https://img.shields.io/badge/AWS-Terraform_Ansible_Docker-orange) 
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A complete IaC solution for deploying containerized applications on AWS using Terraform for provisioning, Docker for containerization, and Ansible for configuration management.

## Table of Contents
- [Architecture Overview](#architecture-overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Workflow](#workflow)
- [Customization](#customization)
- [Best Practices](#best-practices)
- [License](#license)

## Architecture Overview

```mermaid
graph TD
    A[Terraform] -->|Provisions| B[AWS VPC]
    B --> C[Public Subnet]
    C --> D[EC2 Instance]
    D -->|Managed by| E[Ansible]
    E -->|Deploys| F[Docker Containers]
    A -->|State Storage| G[S3 Bucket]
    B -->|Internet Access| H[Internet Gateway]
```

## 📋 Prerequisites

Before getting started, ensure you have the following installed and configured:

- ✅ **AWS Account** with programmatic access
- ✅ IAM permissions for:
  - EC2
  - VPC
  - S3
  - IAM
- ✅ **Terraform** v1.0+
- ✅ **Ansible** v2.10+
- ✅ **AWS CLI** configured with credentials (`aws configure`)
- ✅ **Docker** (for local testing and containerization)

---

## 🔧 Getting Started

Follow these steps to deploy the infrastructure and configure your environment:

### 1. Clone the Repository

```bash
git clone https://github.com/your-repo/aws-terraform-ansible-docker.git
cd aws-terraform-ansible-docker

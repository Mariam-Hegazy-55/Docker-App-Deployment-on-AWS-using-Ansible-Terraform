# Cloud Infrastructure Automation with Terraform, Docker, and Ansible

![AWS Terraform Docker Ansible](https://img.shields.io/badge/AWS-Terraform_Ansible_Docker-orange) 
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A complete IaC solution for deploying containerized applications on AWS using Terraform for provisioning, Docker for containerization, and Ansible for configuration management.
---
## 📚 Table of Contents

1. [📌 Architecture Overview](#architecture-overview)
2. [🚀 Features](#-features)
3. [🛠️ Tools & Technologies](#️-tools--technologies)
4. [📦 Terraform Modules](#-terraform-modules)
5. [📂 Folder Structure](#-folder-structure)
6. [⚙️ Prerequisites](#prerequisites)
7. [🔄 Workflow Overview](#workflow-overview)
---
## Architecture Overview
``` mermaid
graph TD
  A[🌍 Region] --> B[🖥️ VPC]
    B --> C[📍 AZ: Availability Zone]
    C --> D[📶 Public Subnet]
    D --> E[🖥️ EC2 Instance]
    E --> F[🐳 Docker Containers]
    F -->|Managed by| G[🤖 Ansible Playbooks]
    B --> H[🌉 Internet Gateway]
    A --> I[🪣 S3 Bucket]
    I --> J[📁 Terraform tfstate]
    J --> K[⚡ Terraform Apply]
```
---

## 🚀 Features

- ✅ Automated infrastructure provisioning with Terraform
- ✅ Configuration management using Ansible
- ✅ Containerized application deployment with Docker
- ✅ Remote state management via S3
- ✅ Modular and scalable design

---

## 🛠️ Tools & Technologies

| Tool        | Purpose                        |
|-------------|--------------------------------|
| Terraform   | Infrastructure provisioning    |
| Ansible     | Configuration management       |
| Docker      | Containerization               |
| AWS EC2     | Hosting Docker containers      |
| AWS S3      | Remote backend for tfstate     |

---

## 📦 Terraform Modules

This project is structured using reusable Terraform modules:

| Module  | Description |
|---------|-------------|
| `vpc`   | Creates the VPC, public subnets, internet gateway, and route tables. |
| `ec2`   | Launches EC2 instances into public subnets. |

Each module is isolated and parameterized to ensure flexibility, scalability, and reuse in other projects.

---
## 📂 Folder Structure

```bash
INFRASTRUCTURE/
├── .terraform/                # Terraform cache directory
│
├── ec2/                       # EC2 instance module
│   ├── main.tf                # Instance configuration
│   ├── output.tf              # Output variables
│   └── variables.tf           # Input variables
│
├── key/                       # SSH key management
│   ├── key.tf                 # Key pair resource
│   |── my-key.pem             # Private key file
|   └── output.tf
│
├── my-web/                    # Web application
│   ├── Dockerfile             # Container configuration
│   ├── index.html             # HTML content
│   ├── script.js              # JavaScript code
│   └── style.css              # CSS styles
│
├── vpc/                       # Networking module
│   ├── main.tf                # VPC resources
│   ├── output.tf              # Network outputs
│   └── variables.tf           # Network variables
│
├── .terraform.lock.hcl        # Provider versions lock
├── backend.tf                 # State backend config
├── inventory.ini              # Ansible inventory
├── main.tf                    # Root configuration
├── playbook.yaml              # Ansible playbook
├── providers.tf               # Provider config
├── terraform.tfvars           # Variable values
└── variables.tf               # Root variables
```
---
## Prerequisites

Before getting started, ensure you have the following installed and configured:

- ✅ **AWS Account** with programmatic access
- ✅ IAM permissions for:
  - EC2
  - VPC
  - S3
- ✅ **Terraform** v1.0+
- ✅ **Ansible** v2.10+
- ✅ **AWS CLI** configured with credentials (`aws configure`)
- ✅ **Docker** (for local testing and containerization)
---
## Workflow Overview
**1. Infrastructure Provisioning (Terraform)**
Creates VPC, subnets, EC2 instances, and an S3 bucket

Configures security groups for SSH and HTTP access

**2. Configuration Management (Ansible)**
Connects to EC2 instances using SSH

Installs Docker and required dependencies

Deploys containers with specified port mappings

**3. Application Deployment (Docker)**
Launches containers with health checks

Exposes services on configured ports

Optionally sets up logging and monitoring

---
## 🌐 Accessing the Application

After successful deployment:

- 🌍 **Web Access:**  
  Access the web application using the public IP address of the EC2 instance


Example:
```bash
curl http://<ec2_public_ip>
```


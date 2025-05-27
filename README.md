
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


Prerequisites
Before you begin, ensure you have the following:

AWS Account with IAM permissions for:

EC2, VPC, S3, and IAM services

Programmatic access enabled

Terraform (v1.0+) installed

Ansible (v2.10+) installed

AWS CLI configured with credentials

Docker (for local testing)

Getting Started
Follow these steps to deploy the infrastructure:

Clone the repository:

bash
git clone https://github.com/your-repo/aws-terraform-ansible-docker.git
cd aws-terraform-ansible-docker
Initialize Terraform:

bash
cd terraform/
terraform init
Review and apply changes:

bash
terraform plan
terraform apply
Run Ansible playbook:

bash
cd ../ansible/
ansible-playbook -i aws_ec2.yml deploy-docker.yml
Workflow
Infrastructure Provisioning:

Terraform creates VPC, subnets, EC2 instances, and S3 bucket

Security groups are configured for SSH and HTTP access

Configuration Management:

Ansible connects to EC2 instances via SSH

Docker and dependencies are installed

Containers are deployed with proper port mappings

Application Deployment:

Docker containers are started with health checks

Services are exposed on configured ports

Logging and monitoring are set up

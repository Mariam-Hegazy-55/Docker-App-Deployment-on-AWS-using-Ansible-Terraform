# Docker-App-Deployment-on-AWS-using-Ansible-Terraform
This project automates the deployment of a scalable and secure cloud infrastructure on AWS using Terraform for provisioning, Docker for containerization, and Ansible for configuration management. The architecture includes AWS networking components, compute resources, and automated application deployment.

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

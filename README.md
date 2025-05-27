# Cloud Infrastructure Automation with Terraform, Docker, and Ansible

![AWS Terraform Docker Ansible](https://img.shields.io/badge/AWS-Terraform_Ansible_Docker-orange) 
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A complete IaC solution for deploying containerized applications on AWS using Terraform for provisioning, Docker for containerization, and Ansible for configuration management.

## Table of Contents
- [Architecture Overview](#architecture-overview)
- [Prerequisites](#prerequisites)
- [Workflow Overview](#Workflow-Overview)


## Architecture Overview
graph TD
  subgraph Terraform Provisioning
    T[Terraform] -->|Generates SSH Key Pair| K[Local Private & Public Key]
    T -->|Creates| VPC[AWS VPC]
    VPC --> PUB[Public Subnet]
    PUB --> EC2[EC2 Instance]
    T -->|Stores State| S3[S3 Bucket]
    VPC --> IGW[Internet Gateway]
  end

  subgraph Configuration & Deployment
    EC2 -->|SSH Access Using Key| A[Ansible Control]
    A -->|Copies App Files| APP_DIR[App Directory on EC2]
    A -->|Installs & Configures| DOCKER[Docker Engine on EC2]
    DOCKER -->|Builds & Runs| CONTAINER[Docker Container (My Web App)]
  end

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



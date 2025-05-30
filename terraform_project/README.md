# 🌐 Terraform Project: 3-Tier Architecture on AWS

## 🧭 Overview

This project implements a **3-tier web application architecture** on AWS using Terraform. It leverages modular and environment-based structuring to provision infrastructure efficiently and consistently across development and production environments.

The architecture spans **multiple Availability Zones** for high availability and includes layers for web, application, and database tiers. Infrastructure components are designed to be scalable, secure, and fault-tolerant.

---

## 🧱 Architecture Breakdown

The infrastructure includes the following components:

- **Region & Availability Zones**
  - 1 AWS Region
  - 2 Availability Zones for HA setup

- **Networking**
  - 1 VPC
  - 3 Subnets per AZ:
    - Public Subnet (Web Tier)
    - Private Subnet (App Tier)
    - Private Subnet (DB Tier)
  - Internet Gateway (IGW) and NAT Gateway for connectivity
  - Public and private route tables with routing for IGW and NAT

- **Compute**
  - Auto Scaling Groups for frontend (web) and backend (app) EC2 instances
  - Launch Templates for consistent EC2 provisioning
  - EC2 instances with:
    - Network configuration
    - Private/Public IP
    - SSH Key-Pair
    - AMI & instance type
    - EBS configuration
    - Security Groups
    - Metadata and tags

- **Load Balancing**
  - Application Load Balancers:
    - Public ALB for Web Tier
    - Private ALB for App Tier
  - HTTP/HTTPS listeners with rules
  - Target groups for EC2 instances

- **Database**
  - Amazon RDS (Aurora) in DB Tier
  - Aurora replica for high availability

---

## 🗂️ Terraform Directory Structure

```plaintext
terraform/
├── modules/
│   ├── network/
│   ├── compute/
│   ├── database/
├── environments/
│   ├── dev/
│   ├── prod/
├── provider.tf
├── variables.tf
├── outputs.tf
├── versions.tf
```
Modules: Reusable infrastructure components (network, compute, database).

Environments: Separate folders for dev and prod, each with its own state backend and variable configurations.

Root Files: Provider setup, variable declarations, and Terraform version constraints.

🔧 Terraform Usage
1. terraform init
Initializes the working directory by downloading necessary providers and setting up the backend configuration.

2. terraform plan
Generates an execution plan, showing what actions Terraform will take without making actual changes.

3. terraform apply
Applies the planned changes to provision the AWS infrastructure.

4. terraform destroy
Removes all the infrastructure managed by the current Terraform configuration.

✅ Benefits
Modular Design: Easier to maintain, extend, and reuse components.

Multi-Environment Support: Isolated configurations for development and production.

Scalability & HA: Auto Scaling and multi-AZ setup ensure performance and resilience.


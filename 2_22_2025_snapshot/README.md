# AWS EC2 Deployment & Storage Snapshot Automation

This repository documents the process of deploying a web application on Amazon EC2 with auto-scaling and load balancing, along with steps to manage EBS volumes, snapshots, and AMIs for data consistency and portability.

---

## 📌 Part 1: Web Application Deployment with Load Balancing and Auto Scaling

### ✅ Objectives

1. Deploy a web application on EC2 instances (Ubuntu).
2. Set up an Application Load Balancer (ALB).
3. Configure an Auto Scaling Group (ASG) with dynamic scaling based on CPU utilization.
4. Test scaling by simulating traffic load.

### 🏗️ Architecture

- **EC2 Instances**: Run the web app.
- **ALB**: Distributes traffic across healthy EC2 instances.
- **ASG**: Automatically adds/removes instances.
- **CloudWatch**: Monitors metrics and triggers scaling.

### 🔍 Load Testing

- Simulated CPU load with tools like Apache Benchmark or stress.
- Verified instances scale in/out as expected.

---

## 📌 Part 2: EBS Snapshot, AMI Creation, and Data Consistency Validation

### ✅ Objectives

1. Launch EC2 instance (Ubuntu), add files.
2. Create a snapshot of the EBS volume (`ebs-01`).
3. Use snapshot to:
   - Create a new volume.
   - Create a new custom AMI.
4. Launch a new EC2 from the custom AMI and validate file consistency.
5. Launch a new EC2 instance (AWS RHEL AMI).
6. Attach the previously created EBS volume.
7. Mount and validate data consistency.

### 🔧 Steps Summary

#### 🔹 Create EC2 (Ubuntu)

- Launch EC2 instance.
- SSH and add files to the root EBS volume.
  ```bash
  echo "Sample Data" > /home/ubuntu/sample.txt
🔹 Snapshot EBS
Identify volume ID (ebs-01) and create a snapshot.

Tag snapshot for identification.

🔹 Create New Volume from Snapshot
Use snapshot to create a new EBS volume in the same AZ.

🔹 Create Custom AMI
Use snapshot as root volume.

Register a new AMI.

🔹 Launch EC2 from Custom AMI
Boot instance using custom AMI.

Verify file /home/ubuntu/sample.txt exists and contents are intact.

🔹 Launch EC2 (AWS RHEL AMI)
Attach previously created EBS volume.

Mount the volume:

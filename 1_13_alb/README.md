# EC2 Web Application Deployment with Load Balancing and Auto Scaling

This project demonstrates the deployment of a web application on Amazon EC2 instances with a scalable and highly available architecture using an Application Load Balancer (ALB) and Auto Scaling Group (ASG).

## 📌 Project Overview

The objective of this project is to:

1. Deploy a web application on EC2 instances.
2. Set up an Application Load Balancer (ALB) to manage and distribute incoming traffic.
3. Configure an Auto Scaling Group (ASG) to automatically adjust the number of EC2 instances based on CPU utilization.
4. Test the scaling behavior by simulating varying levels of traffic.

## 🚀 Architecture

The infrastructure setup includes:

- **EC2 Instances**: Hosting the web application.
- **Application Load Balancer (ALB)**: Distributes traffic across healthy instances.
- **Auto Scaling Group (ASG)**: Dynamically scales the number of EC2 instances based on demand.
- **CloudWatch Alarms**: Monitor CPU usage and trigger scaling events.

## 🔧 Key Components

- **Launch Template / Configuration**: Defines the instance configuration used by the ASG.
- **Target Group**: Linked to the ALB and associated with EC2 instances.
- **Scaling Policies**: 
  - **Scale-Out**: Add instances when average CPU utilization > 70%.
  - **Scale-In**: Remove instances when average CPU utilization < 30%.
 the target group, and old ones were terminated properly when the load decreased.

## 📎 Notes

- Security groups and IAM roles should be properly configured for least privilege.
- Ensure your application is stateless or uses a shared data store for better scalability.

# EC2 Instance Deployment Using Terraform with AWS CLI

## 🧭 Aim

To deploy an EC2 instance on AWS using Terraform by creating and organizing the required configuration files. The process includes AWS CLI setup, Terraform installation, and implementing best practices like variable usage.

---

## 🔧 Task Summary

1. **Install Required Tools**  
   Begin by installing Terraform and AWS CLI on your system to interact with both Terraform configuration and AWS services.

2. **Configure AWS CLI**  
   Use AWS access and secret keys to configure CLI access to your AWS account. This sets up local credentials used by Terraform for authentication.

3. **Create Terraform Configuration Files**  
   Set up the foundational Terraform files:
   - `provider.tf`: Declares the AWS provider and region.
   - `main.tf`: Contains the EC2 resource block using a base template from AWS Terraform documentation.

4. **Modify the EC2 Resource Block**  
   Customize the instance resource block to meet the following requirements:
   - Use the AMI ID for Ubuntu.
   - Set the instance type to **t3.micro**.
   - Manually specify a Subnet ID.
   - Ensure the public IP address is disabled.
   - Increase the root EBS volume size from 8 GB to 12 GB.

5. **Introduce Variables**  
   - Create `variables.tf` to define input variables for the EC2 configuration.
   - Create `terraform.tfvars` to supply actual values for the variables like AMI ID, instance type, subnet ID, and volume size.

---

## ✅ Outcome

The result is a reproducible Terraform configuration that launches a custom EC2 instance with minimal hardcoding. This setup adheres to Infrastructure as Code (IaC) best practices, making the configuration modular, reusable, and easy to manage.

---

## 🧾 Notes

- Avoid committing sensitive data like access keys or `terraform.tfstate` to version control.
- Consider enabling remote backends and state locking for production environments.
- Validate and format Terraform files regularly during development.

---

## 📬 Contact

For support or suggestions, please contact [Your Name or Email].

# Web Application Deployment with Load Balancer and Auto Scaling

## 🧭 Aim

To deploy a web application on Amazon EC2 instances with high availability and scalability using an Application Load Balancer (ALB) and an Auto Scaling Group (ASG). The setup is validated by simulating traffic to test the scaling behavior.

---

## 🔧 Task Summary

1. **Deploy the Web Application on EC2**
   - Launch one or more EC2 instances to host the web application.
   - Ensure the application is installed and running on the instances.

2. **Set Up the Application Load Balancer (ALB)**
   - Configure an ALB to distribute incoming traffic across the EC2 instances.
   - Define appropriate listeners and target groups.
   - Ensure health checks are set up to route traffic only to healthy instances.

3. **Configure Auto Scaling Group (ASG)**
   - Create an ASG to manage the number of EC2 instances automatically.
   - Define a launch template or configuration.
   - Set scaling policies based on metrics like average CPU utilization.

4. **Simulate Traffic to Test Scaling**
   - Generate load to trigger scale-out actions.
   - Monitor the behavior of the ASG as it adds new instances.
   - Reduce load to observe scale-in behavior.

---

## ✅ Outcome

A resilient and scalable web application infrastructure where:

- The ALB ensures high availability and load distribution.
- The ASG automatically adjusts capacity based on real-time traffic and resource utilization.
- The system is validated through controlled traffic simulation.

---

## 🧾 Notes

- Ensure EC2 instances are stateless or use shared storage to maintain application consistency across scaling.
- Monitor with Amazon CloudWatch for visibility into scaling metrics and instance health.
- Use security groups and IAM roles with the principle of least privilege.

---

## 📬 Contact

For questions or collaboration, please contact [Your Name or Email].

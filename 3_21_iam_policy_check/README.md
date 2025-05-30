# Custom IAM Policy for EC2 Instance Management

## 🧭 Aim

To create a custom IAM policy that grants limited EC2 instance management permissions. The policy should:

- ✅ Allow starting and stopping EC2 instances.
- ❌ Explicitly deny terminating EC2 instances.
- 🌍 Restrict all actions to the `us-west-2` region only.
- 👁️ Allow describing EC2 instances to enable visibility.

---

## 📝 JSON Policy Document

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowStartStopDescribeEC2InRegion",
      "Effect": "Allow",
      "Action": [
        "ec2:StartInstances",
        "ec2:StopInstances",
        "ec2:DescribeInstances"
      ],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:RequestedRegion": "us-west-2"
        }
      }
    },
    {
      "Sid": "ExplicitDenyTerminateInstances",
      "Effect": "Deny",
      "Action": "ec2:TerminateInstances",
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:RequestedRegion": "us-west-2"
        }
      }
    }
  ]
}
```


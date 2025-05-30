# AWS S3 Bucket Creation and File Upload via AWS CLI

## 🧭 Aim

To create an AWS S3 bucket using the AWS CLI, upload a sample text file to it, and make the file accessible via the internet.

---

## 🧰 Prerequisites

- AWS CLI installed and configured with appropriate credentials.
- IAM user/role must have `s3:*` permissions or the required subset.
- A sample `.txt` file ready for upload.

---

## 📝 Steps

### 1. ✅ Create a New S3 Bucket

```bash
aws s3api create-bucket --bucket my-sample-bucket-12345 --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2
```
Replace my-sample-bucket-12345 with a globally unique bucket name.
2. ⬆️ Upload a Sample Text File
Place a text file in your local directory, e.g., sample.txt.

bash
Copy
Edit
aws s3 cp sample.txt s3://my-sample-bucket-12345/
3. 🌐 Make the File Publicly Accessible
Set the object ACL to public-read:

bash
Copy
Edit
aws s3api put-object-acl --bucket my-sample-bucket-12345 --key sample.txt --acl public-read
4. 🌍 Browse the File Using Internet
The file can now be accessed at:

bash
Copy
Edit
https://my-sample-bucket-12345.s3.us-west-2.amazonaws.com/sample.txt
Ensure your bucket does not have public access block settings enabled, or modify them to allow public reads for this object.


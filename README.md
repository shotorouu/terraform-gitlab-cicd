# AWS Infrastructure with Terraform & GitLab CI/CD

A simple project demonstrating how to provision AWS infrastructure (VPC, Subnet, Security Group, EC2) using Terraform and automate the workflow via GitLab CI/CD with remote S3 state storage and DynamoDB locking.

---

## 📁 Project Structure
```
├── bootstrap/        # One-time setup: S3 bucket & DynamoDB table for backend state
├── config/           # Infrastructure modules
│├── vpc/             # Custom VPC & Security Group
│└── web/             # EC2 Instance configuration
└── .gitlab-ci.yml    # CI/CD Pipeline definition
```
---

## 🔄 CI/CD Pipeline Workflow
The pipeline automatically triggers on push with the following stages:

1. Validate: Checks HCL syntax and configuration.
2. Plan: Generates an execution plan artifact (planfile).
3. Apply: Applies changes to AWS (Manual trigger required).
4. Destroy: Tears down provisioned AWS resources (Manual trigger required).


##  For local testing

1. Prerequisite: Bootstrap State Backend
Before running the main pipeline, set up the remote backend storage locally once:

```bash
cd bootstrap
terraform init
terraform apply -var="bucket_backend=YOUR_BUCKET_NAME" -var="table_backend=YOUR_TABLE_NAME"
```
2. Configure GitLab CI/CD Variables
In your GitLab repository, go to Settings > CI/CD > Variables and add:

`MY_AWS_ACCESS_KEYAWS` Access Key ID
`MY_AWS_SECRET_KEYAWS` Secret Access Key

And ensure that AWS_BACKEND_BUCKET and AWS_BACKEND_TABLE inside .gitlab-ci.yml match the resources created in Step 1.

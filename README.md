# Multi-Environment Infrastructure with Terraform  
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/18573e77-3fcb-4c79-9156-bd608a4a8829" />


---

## 🔍 Project Overview  
This project is a Terraform-based infrastructure setup that supports **multiple environments** (development, staging, production) by re-using a single module (`infra-app`) and passing environment-specific values.  
It demonstrates how to maintain consistent infrastructure code, yet deploy differently configured environments with minimal duplication.

Key features:  
- One Terraform module (`infra-app`) for common infrastructure resources (EC2, S3, DynamoDB)  
- Root configuration that invokes the module three times: `dev`, `stg`, `prd`  
- Environment-specific parameters (AMI, instance type, bucket name, count)  
- Clear folder structure and separation of concerns  

---

## 🗂️ Repository Structure  
/
├── main.tf ← Root configuration, invokes module for each environment
├── providers.tf ← AWS provider settings
├── terraform.tf ← (optional) backend/state configuration
└── infra-app/ ← Module directory
├── variables.tf ← Module input variable declarations
├── ec2.tf ← EC2 + security group resources
├── s3.tf ← S3 bucket resource
├── dynamodb.tf ← DynamoDB table resource
└── … ← (public key file or other module files)

yaml
Copy code

---

## 📊 Diagram  
Here is a visual representation of how the architecture and module invocation works across environments:  

![Architecture Diagram](diagram.gif)  

*(Replace `diagram.gif` with your actual GIF file)*

---

## 🚀 How to Use  
1. Clone the repository:  
   ```bash
   git clone https://github.com/PriyanshuSingh10114/Multi-Enviornment-Infrastructure-with-Terraform.git
   cd Multi-Enviornment-Infrastructure-with-Terraform
Review main.tf – you’ll see three module blocks for dev-infra, stg-infra, prd-infra, each passing environment-specific values.

Ensure your AWS credentials are configured (via ~/.aws/credentials or environment variables).

Initialize Terraform:

bash
Copy code
terraform init
Plan and apply for each environment:

bash
Copy code
terraform plan     # to preview  
terraform apply    # to create resources  
You may use workspaces or vary the env parameter if you want separate states for each environment.

After deployment you’ll have separate stacks for dev, staging and production — each using the same module but with different configurations.

🎯 Purpose & Benefits
Reusability: One module covers shared resources.

Consistency: All environments use same codebase; only values change.

Maintainability: Changes in the module propagate across environments.

Clarity: Environment differentiation is only in values, not code duplication.

✅ Next Steps & Enhancements
Add remote state backends (e.g., S3 + DynamoDB) for each environment.

Add workspace support or environment-specific state files.

Add CI/CD pipelines for automated terraform plan and terraform apply.

Add tagging, naming conventions, cost-monitoring.

Add more AWS services or modules (VPC, RDS, Lambda, IAM) for full production readiness

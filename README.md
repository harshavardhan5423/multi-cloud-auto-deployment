# 🌐 Multi-Cloud Auto Deployment using Terraform (AWS + GCP Free Tier)

# 🌐 Multi-Cloud Auto Deployment using Terraform (AWS + GCP Free Tier)

## 📌 Objective
Provision resources in **AWS** and **GCP** simultaneously using Terraform and validate **auto-deployment** with a single command.

---

## 🛠 Tools Used
- **Terraform** – Infrastructure as Code
- **AWS Free Tier**
- **GCP Free Tier**
- **NGINX** – Web server
- **DNSMasq (local)** – DNS routing simulation

---

## 📋 Steps Involved
1. Configure Terraform providers for both **AWS** & **GCP**.
2. Deploy **web servers** and configure health checks.
3. Use **DNSMasq / HTTP checks** to simulate routing based on availability.
4. Validate deployments via:
   - Cloud Dashboards (AWS & GCP)
   - Local health checks
5. Document setup with infrastructure diagram and report.

---

## 📦 Deliverables
- ✅ Terraform Scripts (`aws.tf`, `gcp.tf`, `main.tf`, `variables.tf`)
- ✅ Infrastructure Diagram (`diagram.png`)
- ✅ Screenshots from AWS & GCP dashboards
- ✅ Deployment Report (`MultiCloud_AutoDeployment_Report.pdf`)

---

## ▶️ How to Run
bash
# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Deploy resources
terraform apply -auto-approve

PROJECT STRUCTURE 

multi-cloud-auto-deployment/
├── aws.tf
├── gcp.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── diagram.png
├── screenshots/
│   ├── aws-dashboard.png
│   ├── gcp-dashboard.png
├── MultiCloud_AutoDeployment_Report.pdf
└── README.md

📖 Notes
Ensure you have AWS CLI and GCP SDK configured with valid credentials before running.
Use .gitignore to exclude sensitive files like gcp.json and terraform.tfstate.
This project is for learning/demo purposes (Free Tier only).

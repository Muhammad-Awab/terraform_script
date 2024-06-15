# Terraform AWS Infrastructure Project

This project sets up an AWS infrastructure using Terraform modules. The infrastructure includes:

- VPC configuration
- Subnet configuration
- Security group with inbound rules for ports 80, 22, and 42
- EC2 instance with Docker preinstalled (no sudo required)
- Elastic IP (EIP) for the EC2 instance
- ECR repository with a lifecycle policy

## Prerequisites

Before you begin, ensure you have the following:

- Terraform installed ([Download Terraform](https://www.terraform.io/downloads))
- AWS CLI configured ([AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html))
- SSH key pair created (Steps provided below)

## Project Structure

The project is organized into multiple modules for better structure and reusability. Here's the directory layout:
```
terraform_project/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── backend.tf
├── modules/
│ ├── vpc/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── subnet/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── security_group/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── key_pair/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── ec2/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── ecr/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│ └── eip/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│ └── backend/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
└── README.md
```
### Module Descriptions

#### VPC Module

**Purpose**: Configures the VPC.

**Files**:
- `modules/vpc/main.tf`: Defines the VPC configuration using data sources.
- `modules/vpc/variables.tf`: Defines variables required by the VPC module.
- `modules/vpc/outputs.tf`: Defines the outputs for the VPC module.

#### Subnet Module

**Purpose**: Configures the subnet.

**Files**:
- `modules/subnet/main.tf`: Defines the subnet configuration using data sources.
- `modules/subnet/variables.tf`: Defines variables required by the subnet module.
- `modules/subnet/outputs.tf`: Defines the outputs for the subnet module.

#### Security Group Module

**Purpose**: Creates and configures the security group.

**Files**:
- `modules/security_group/main.tf`: Defines the security group and its rules.
- `modules/security_group/variables.tf`: Defines variables required by the security group module.
- `modules/security_group/outputs.tf`: Defines the outputs for the security group module.

#### Key Pair Module

**Purpose**: Manages the SSH key pair.

**Files**:
- `modules/key_pair/main.tf`: Imports or creates the key pair.
- `modules/key_pair/variables.tf`: Defines variables required by the key pair module.
- `modules/key_pair/outputs.tf`: Defines the outputs for the key pair module.

#### EC2 Module

**Purpose**: Launches an EC2 instance with Docker preinstalled and assigns a security group and key pair.

**Files**:
- `modules/ec2/main.tf`: Defines the EC2 instance configuration.
- `modules/ec2/variables.tf`: Defines variables required by the EC2 module.
- `modules/ec2/outputs.tf`: Defines the outputs for the EC2 module.

#### ECR Module

**Purpose**: Creates an ECR repository and sets a lifecycle policy.

**Files**:
- `modules/ecr/main.tf`: Defines the ECR repository and its lifecycle policy.
- `modules/ecr/variables.tf`: Defines variables required by the ECR module.
- `modules/ecr/outputs.tf`: Defines the outputs for the ECR module.

## SSH Key Pair Generation

If you don't already have an SSH key pair, you can create one using the following command:

```sh
ssh-keygen -t rsa -b 2048 -f ~/.ssh/your_key_name
```
Replace your_key_name with your desired key name. Ensure the public key (your_key_name.pub) is stored in ~/.ssh/.

## Usage

Follow these steps to use this Terraform configuration:

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-repo/terraform_project.git
   cd terraform_project
   terraform init
   terraform plan
   terraform apply
   ```



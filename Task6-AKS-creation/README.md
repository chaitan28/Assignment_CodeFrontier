# Terraform AKS Deployment

This document provides step-by-step instructions to initialize, plan, and apply the Terraform configuration to deploy an Azure Kubernetes Service (AKS) cluster.

## Prerequisites
Ensure you have the following tools installed:
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

### 1️⃣ **Login to Azure**
Run the following command to authenticate with Azure:
```sh
az login
```
If you have multiple subscriptions, set the active subscription:
```sh
az account set --subscription "<your-subscription-id>"
```

### 2️⃣ **Initialize Terraform**
Run the following command to initialize the Terraform backend and download necessary providers:
```sh
terraform init
```

### 3️⃣ **Plan Terraform Deployment**
Run the following command to preview the resources that Terraform will create:
```sh
terraform plan
```
If you are using a variables file (`terraform.tfvars`), specify it explicitly:
```sh
terraform plan -var-file="terraform.tfvars"
```

### 4️⃣ **Apply Terraform Configuration**
Run the following command to create the resources:
```sh
terraform apply
```
To avoid interactive approval, use:
```sh
terraform apply -auto-approve
```

### 5️⃣ **Verify AKS Deployment**
Retrieve the AKS credentials and configure `kubectl`:
```sh
az aks get-credentials --resource-group <resource-group-name> --name <aks-cluster-name>
```
Check if the nodes are running:
```sh
kubectl get nodes
```

### 6️⃣ **Destroy Resources (Optional)**
To delete all Terraform-managed resources:
```sh
terraform destroy
```
To skip confirmation:
```sh
terraform destroy -auto-approve
```

## Troubleshooting
- If `terraform init` fails, ensure the backend storage (Azure Blob Storage) exists.
- If `terraform apply` fails, check your Azure subscription quota and permissions.
- If `kubectl get nodes` shows no resources, verify `az aks get-credentials` was executed correctly.

## References
- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure Kubernetes Service Documentation](https://learn.microsoft.com/en-us/azure/aks/)


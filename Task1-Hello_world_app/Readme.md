# Development of Python application
### 1. Create a Azure VM
- login to the Vm dashboard
- create a Vm with configuration of size
```sh
RG: codefrontier
Standard B2ms
vCPUs: 2
RAM: 8 GiB
```
- Assigned a Static Public given below:
```sh
IP: 135.235.162.200
```
### 2. Create a Azure Mysql database 
- Resource Group: RG
- Server Name: codefrontier
- Location: Central India
- Version: MySQL 8.0
- Compute + Storage: Standard_B1ms (1 vCore, 2 GiB memory, 640 max iops)
- Admin Username: admin123
- Password: Admin@280324

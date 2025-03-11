# Helm Chart Guide

## 📌 Prerequisites
Ensure you have the following installed:
- [Helm](https://helm.sh/docs/intro/install/)
- [Kubernetes](https://kubernetes.io/docs/setup/) cluster running
- `kubectl` configured to interact with your cluster

---

## 🚀 Creating a Helm Chart
To create a new Helm chart:
```sh
helm create flask-mysql #this will create a directory called flask-mysql
git clone https://github.com/chaitan28/Assignment_CodeFrontier.git
cd Task5-Helm-charts # copy all the files in the template folder to previous created flask-mysql

```

---

## 🔧 Customizing the Helm Chart
Modify the `values.yaml` file to customize configurations such as:
- **Replica count**
- **Container image details**
- **Service type** (ClusterIP, NodePort, LoadBalancer)
- **Environment variables**
- **Persistent storage**

Example `values.yaml` snippet:
```yaml
replicaCount: 2
image:
  repository: myrepo/myapp
  tag: latest
service:
  type: LoadBalancer
  port: 80
```

---

## 📥 Installing the Helm Chart
To deploy the Helm chart:
```sh
helm install myrelease ./flask-mysql
```
- `myrelease` is the release name.
- `./flask-mysql` is the chart directory.

Verify the installation:
```sh
helm list
kubectl get pods,svc
```

---

## 🔄 Upgrading a Helm Release
To upgrade a deployed Helm release:
```sh
helm upgrade myrelease ./flask-mysql -f values.yaml
```

---

## ❌ Uninstalling a Helm Chart
To delete a release and its resources:
```sh
helm uninstall myrelease
```
Check if resources are removed:
```sh
helm list
kubectl get pods,svc
```

---

## 📦 Storing Helm Charts
You can package a Helm chart and store it in a repository.
### Package the chart:
```sh
helm package flask-mysql
```
This creates a `.tgz` file.

### Push to a Helm repository:
```sh
helm repo add myrepo https://example.com/helm-charts
helm push flask-mysql-0.1.0.tgz myrepo
```

### List available charts:
```sh
helm search repo myrepo
```

---

## 🎯 Deploying from a Helm Repository
```sh
helm install myrelease myrepo/flask-mysql
```

---

## 🔍 Debugging Helm Deployments
Check Helm release history:
```sh
helm history myrelease
```
View Helm logs:
```sh
kubectl logs -l app=myapp
```
Check for failed pods:
```sh
kubectl get pods
kubectl describe pod <pod-name>
```

---

## 📢 Conclusion
This guide provides a quick start for creating, deploying, managing, and storing Helm charts. Customize `values.yaml` based on your requirements, and use Helm repositories for version control and sharing.

For more details, check the [Helm documentation](https://helm.sh/docs/). 🚀


# Outputs
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}


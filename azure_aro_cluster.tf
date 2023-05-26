data "azurerm_subscription" "current" {
}

resource "azapi_resource" "aro-cluster" {
  type      = "Microsoft.RedHatOpenShift/OpenShiftClusters@2022-09-04"
  name      = var.aro_cluster_name
  parent_id = azurerm_resource_group.aro-rg.id
  location  = azurerm_resource_group.aro-rg.location
  timeouts {
    create = "60m"
  }
  body = jsonencode({
    properties = {
      clusterProfile = {
        domain               = var.aro_cluster_domain
        resourceGroupId      = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.aro_cluster_resource_group_name}"
        pullSecret           = var.aro_pull_secret
        fipsValidatedModules = "Enabled"
      }
      networkProfile = {
        podCidr     = var.aro_network_pod_cidr
        serviceCidr = var.aro_network_service_cidr
      }
      servicePrincipalProfile = {
        clientId     = var.aro_sp_client_id
        clientSecret = var.aro_sp_client_secret
      }
      masterProfile = {
        vmSize           = var.aro_master_size
        subnetId         = azurerm_subnet.master-subnet.id
        encryptionAtHost = "Disabled"
      }
      workerProfiles = [
        {
          name             = "worker"
          vmSize           = var.aro_worker_size
          diskSizeGB       = 128
          subnetId         = azurerm_subnet.worker-subnet.id
          count            = var.aro_worker_count
          encryptionAtHost = "Disabled"
        }
      ]
      apiserverProfile = {
        visibility = var.aro_cluster_api_server_visibility
      }
      ingressProfiles = [
        {
          name       = "default"
          visibility = var.aro_cluster_ingress_visibility
        }
      ]
    }
  })
}
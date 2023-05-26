variable "location" {
  description = "The location where the resource group should be created"
  type        = string
  default     = "australiaeast"
}

variable "rg_name" {
  description = "The name of the resource group to create"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network to create"
  type        = string
}

variable "vnet_cidr" {
  description = "The address space for the virtual network"
  type        = string
}

variable "vnet_master_subnet_cidr" {
  description = "The address space for the master subnet, must be within the address space of the virtual network"
  type        = string
}

variable "vnet_worker_subnet_cidr" {
  description = "The address space for the worker subnet, must be within the address space of the virtual network"
  type        = string
}

variable "aro_cluster_name" {
  description = "The name of the ARO cluster resource"
  type        = string
}

variable "aro_cluster_resource_group_name" {
  description = "The name of the ARO cluster resource group"
  type        = string
}

variable "aro_cluster_api_server_visibility" {
  type = string
}

variable "aro_cluster_ingress_visibility" {
  type = string
}

variable "aro_cluster_domain" {
  description = "The domain of the ARO cluster. Either set to an FQDN for a custom domain or a random value to be used with the default domain."
  type        = string
}

variable "aro_pull_secret" {
  default = ""
}

variable "aro_master_size" {
  type = string
}

variable "aro_worker_size" {
  type = string
}

variable "aro_worker_count" {
  type = number
}

variable "aro_network_pod_cidr" {
  type = string
}

variable "aro_network_service_cidr" {
  type = string
}

variable "aro_sp_client_id" {
  type = string
}

variable "aro_sp_client_object_id" {
  type = string
}

variable "aro_sp_client_secret" {
  type = string
}

variable "aro_rp_object_id" {
  type = string
}

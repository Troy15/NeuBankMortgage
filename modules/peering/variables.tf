variable "peerings" {
  description = "A list of VNet peering specifications"
  type = list(object({
    name              = string
    resource_group_name = string
    vnet_name         = string
    peer_vnet_id      = string
    allow_forwarded_traffic = bool
    allow_vnet_access = bool
    allow_gateway_transit = bool
    use_remote_gateways = bool
  }))
}

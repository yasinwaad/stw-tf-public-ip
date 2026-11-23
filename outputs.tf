output "public_ip_ids" {
  description = "Map of public IP IDs, keyed by the names in public_ips."
  value       = { for key, ip in azurerm_public_ip.this : key => ip.id }
}

output "public_ip_addresses" {
  description = "Map of public IP addresses, keyed by the names in public_ips."
  value       = { for key, ip in azurerm_public_ip.this : key => ip.ip_address }
}
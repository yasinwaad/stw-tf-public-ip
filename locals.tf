locals {
  public_ip_names = {
    for key, ip in var.public_ips :
    key => "pip-${key}-${var.project_name}-${var.environment}-${var.location}"
  }

  common_tags = {
    project = var.project_name
    owner   = var.owner
  }
}
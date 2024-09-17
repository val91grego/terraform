# Function for cross workspace syslog

resource "azurerm_log_analytics_saved_search" "cross_Workspace_syslog" {
  name                       = "cross_workspace_syslog"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.la.id

  category       = "Syslog"
  display_name   = "cross_workspace_syslog"
  function_alias = "cross_workspace_syslog"
  query          = <<QUERY
union
workspace("la-demo-terraform").Syslog,
workspace("sntl-poc-scramble").Syslog
QUERY
}

# Function for Sentinel Alerts
resource "azurerm_log_analytics_saved_search" "sentinel_alerts" {
  name                       = "SentinelAlerts"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.la.id

  category       = "SentinelAlerts"
  display_name   = "SentinelAlerts"
  function_alias = "SentinelAlerts"
  query          = <<QUERY
SecurityAlert
| where ProviderName == "MDATP"
QUERY
}

# Customer Map
resource "azurerm_log_analytics_saved_search" "customer_map" {
  name                       = "AzureFunctionsDetectifyVulnscanner"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.la.id
  category                   = "ActiveLists"
  display_name               = "customer_map"
  function_alias             = "customer_map"
  query                      = <<QUERY
datatable (CustomerName:string, MonitoringStatus:bool, WorkspaceName:string, WorkspaceId:string, ResourceGroup:string, SubscriptionId:string, TenantId:string, Owner:string )
[
"MSSP-SENTINEL",true,"siem-euw-obrela-mssp-uat","678f26ec-5038-4130-889c-5cd0df5116fc","rg-euw-obrela-mssp-uat","6e5d5798-a0c1-4a69-8ec7-d5f43295a74e","f8769807-a158-4702-9dbc-58a7a8f73e29","OBRELA",
"Omicron Industries",true,"siem-euw-omicron-prod","481dde27-b13a-4033-b615-25b5751c9ec2","rg-euw-omicron-sentinel","ce9afd54-e554-48f1-8778-976ef7cddb76","3dcbf8f7-ebf5-4cee-8104-979d795ea45d","OBRELA"
]
QUERY

  lifecycle {
    ignore_changes = [tags]
  }
}

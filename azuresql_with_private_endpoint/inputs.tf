variable "rg_name" {
  type    = string
  default = "azsql_privateendpoint"
}

variable "rg_location" {
  type    = string
  default = "East US"
}

variable "vnet_name" {
  type    = string
  default = "db-private-ep-vnet"
}
variable "network_range" {
  type        = string
  default     = "10.0.0.0/16"
  description = "this is network range"
}

variable "subnet_names" {
  type        = list(string)
  default     = ["subnet1", "subnet2"]
  description = "these are subnet names"
}

variable "endpoints_subnet" {
  description = "Set to true to enable service endpoints for one subnet."
  default     = true
}



variable "mssql_config" {
  type = object({
    azsql_db_name     = string
    azsql_collation   = string
    azsql_licensetype = string
    username          = string
    password          = string
    azsql_sku         = string
    sa_type           = string
    db_sample         = string
    max_size          = number
    subnet_name       = string
  })
  default = {
    azsql_db_name     = "privateeptest"
    azsql_collation   = "SQL_Latin1_General_CP1_CI_AS"
    azsql_licensetype = "LicenseIncluded"
    username          = "ashik"
    password          = "India@1431"
    azsql_sku         = "Basic"
    sa_type           = "Local"
    db_sample         = "AdventureWorksLT"
    max_size          = 2
    subnet_name       = "subnet2"
  }
}

variable "sql_server_name" {
  type    = string
  default = "azpub-azsqlserver"
}

variable "sql_connection_policy" {
  type    = string
  default = "Default"
}

variable "sql_public_access" {
  type    = bool
  default = false
}

variable "azsql_version" {
  type    = string
  default = "12.0"
}


variable "p_ep_name" {
  type    = string
  default = "azsqlprivate-endpoint"
}

variable "p_ep_subresource" {
  type    = list(any)
  default = ["sqlServer"]
}

variable "sql_dns_zone_name" {
  type    = string
  default = "azsql.privatedns"
}

variable "sql_dns_vnet_name" {
  type    = string
  default = "dnslink-vnet"
}
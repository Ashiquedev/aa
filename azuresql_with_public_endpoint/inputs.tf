variable "rg_name" {
  type    = string
  default = "azsql_publicendpoint"
}

variable "rg_location" {
  type    = string
  default = "East US"
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
  default = true
}

variable "azsql_version" {
  type    = string
  default = "12.0"
}


variable "azsql_db_name" {
  type    = string
  default = "pubeptest"
}

variable "azsql_collation" {
  type    = string
  default = "SQL_Latin1_General_CP1_CI_AS"
}

variable "azsql_licensetype" {
  type    = string
  default = "LicenseIncluded"
}

variable "azsql_sku" {
  type    = string
  default = "Basic"
}

variable "sa_type" {
  type    = string
  default = "Local"
}

variable "db_sample" {
  type    = string
  default = "AdventureWorksLT"
}

variable "max_size" {
  type    = number
  default = 2
}

variable "sql_firewall_rule_name" {
  type    = string
  default = "sql_firewall_rule01"
}

variable "sql_client_ip" {
  type    = list()
  default = ["157.47.53.212"]
}

variable "sql_server_username" {
  type    = string
  default = "ashik"
}

variable "sql_server_password" {
  type    = string
  default = "India@1431"
}



variable "backend_config" {
  type = object({
    backend_access_key   = "FPzZ46kCf/dUjTKWe0fRdOAlBbIh28NrC+22uDBrxjYfTw1+TWpVvmuAyLqbfp9aLMCHdgxDVEyh+AStKk5l4A=="
    resource_group_name  = "terraform_backend_rg"
    storage_account_name = "tfstatestoresa01"
    container_name       = "tfstatepubendpt"
    key                  = "terraform.tfstate"
  })
}
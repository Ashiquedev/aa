rg_name     = "azsql_privateendpoint"
rg_location = "East US"

vnet_name     = "db-private-ep-vnet"
network_range = "10.0.0.0/16"

subnet_names     = ["subnet1", "subnet2"]
endpoints_subnet = true

sql_server_name       = "azpub-azsqlserver"
sql_connection_policy = "Default"
azsql_version         = "12.0"
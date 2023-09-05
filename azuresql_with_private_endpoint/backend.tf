#======backend==================

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform_backend_rg"
    storage_account_name = "tfstatestoresa01"
    container_name       = "tfstateprivateendpt"
    key                  = "terraform.tfstate"
    access_key           = "FPzZ46kCf/dUjTKWe0fRdOAlBbIh28NrC+22uDBrxjYfTw1+TWpVvmuAyLqbfp9aLMCHdgxDVEyh+AStKk5l4A=="
  }
}
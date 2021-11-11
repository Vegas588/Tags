# A list of objects. The "name" will be used as the index.

resource_groups = [
  {
    name     = "Terraform1"
    location = "eastus2" //Azure Region to use
    tags = {
      created_by = "xxx.xxx"
      contact_dl = "xxx.xxx@xyz.com"
      env        = "dev"
    }
  },
  {
    name     = "Terraform2"
    location = "eastus2" //Azure Region to use
    tags = {
      created_by = "yyy.yyy"
      contact_dl = "yyy.yyy@xyz.com"
      env        = "nprd"
    }
  }
]

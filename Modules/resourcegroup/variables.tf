# -
# - Resource Group
# - https://www.terraform.io/docs/language/expressions/type-constraints.html#collection-types
# - List of objects
variable "resource_groups" {
  description = "Resource groups list"
  type = list(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

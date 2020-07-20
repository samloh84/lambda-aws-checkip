locals {
  name = join(var.delimiter, [for v in [
    var.common_tags.project,
    var.resource_type,
    var.resource_name]: lower(v) if v != null && v != ""])

  tags = merge({for k, v in {
    Name = local.name
    Owner = var.common_tags.owner,
    Project = var.common_tags.project
  } : k=>v if v != null && v != ""},
  lookup(var.custom_tags, var.resource_type, {})
  )
}

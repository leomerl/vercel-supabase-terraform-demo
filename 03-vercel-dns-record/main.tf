resource "vercel_dns_record" "records" {
  for_each = { for idx, record in var.dns_records : "${record.name}-${record.type}" => record }

  domain  = var.domain
  name    = each.value.name
  type    = each.value.type
  value   = each.value.value
  ttl     = each.value.ttl
  team_id = var.team_id != "" ? var.team_id : null
}
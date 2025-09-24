output "dns_records" {
  description = "Created DNS records"
  value = {
    for k, v in vercel_dns_record.records : k => {
      id     = v.id
      name   = v.name
      type   = v.type
      value  = v.value
      domain = v.domain
    }
  }
}
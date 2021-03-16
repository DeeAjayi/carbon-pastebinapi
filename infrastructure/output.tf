output "ecr_repository_worker_endpoint" {
    value = aws_ecr_repository.pastebin.repository_url
}


output "alb_dns_name" {
  value = aws_lb.pastebin_lb.dns_name
}

output "postgres_db" {
  value = aws_db_instance.default.address
}
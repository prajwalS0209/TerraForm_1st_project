output "private_subnet_id" {
  value = aws_subnet.private.id
  description = "private subnet id"
}

output "public_subnet_id" {
    value = aws_subnet.public.id
  description = "public subnet id"
}
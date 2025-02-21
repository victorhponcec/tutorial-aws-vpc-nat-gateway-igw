#Retrieve AWS AZ Information
data "aws_region" "current" {}

output "current_region" {
  value = data.aws_region.current.name
}

output "EC2_instance_id" {
  value = aws_instance.amazon_linux_private_sbnt.id
}
#EC2 Instances
resource "aws_instance" "amazon_linux_private_sbnt" {
  ami                  = "ami-05576a079321f21f8"
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.web.id]
  subnet_id            = aws_subnet.private_subnet.id
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
}
#Security Group - EC2
resource "aws_security_group" "web" {
  name        = "web"
  description = "allow web traffic"
  vpc_id      = aws_vpc.main.id
}
#Ingress rule for Security Group
resource "aws_vpc_security_group_ingress_rule" "allow_443" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}
#Ingress rule for Security Group
resource "aws_vpc_security_group_ingress_rule" "allow_80" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}
#Ingress rule for Security Group
resource "aws_vpc_security_group_ingress_rule" "allow_icmp" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  to_port           = -1
  ip_protocol       = "icmp"
}
#Egress rule for Security Group
resource "aws_vpc_security_group_egress_rule" "egress_all" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
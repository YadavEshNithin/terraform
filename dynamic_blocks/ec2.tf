resource "aws_instance" "HelloWorld_terraform" {
  for_each      = toset(var.instances)
  ami           = var.ami_id
  instance_type = each.key == "mysql" ? "t3.micro" : "t2.micro"
  # instance_type = each.value
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = each.key
  }
}


resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description


  dynamic "ingress" {
    for_each = var.instance_ports
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = "-1"
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags

}
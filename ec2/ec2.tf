resource "aws_instance" "HelloWorld_terraform" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = local.sg_id
  

  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_security_group" "allow_all" {
    name        = "allow-all"
    description = "Allow TLS inbound traffic and all outbound traffic"



    ingress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

    # lifecycle {
    #   create_before_destroy = true
    # }

    tags = {
      Name = "allow-all"
    }

}
resource "aws_instance" "HelloWorld_terraform" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = local.sg_id

  #  provisioner "file" {
  #   source      = "bootstrap.sh"
  #   destination = "/tmp/bootstrap.sh"
  # }

  # connection {
  #   type     = "ssh"
  #   user     = "ec2-user"
  #   password = "DevOps321"
  #   host     = self.public_ip
  # }

 



  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/bootstrap.sh",
  #     "sudo sh /tmp/bootstrap.sh ",
  #   ]
  # }

    # need more for terraform
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }
  user_data = file("bootstrap.sh")
  #iam_instance_profile = "TerraformAdmin"


  tags = {
    Name = "docker_instance_terraform"
  }
}


resource "aws_security_group" "allow_all" {
  name        = "allow-all-docker-instance"
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

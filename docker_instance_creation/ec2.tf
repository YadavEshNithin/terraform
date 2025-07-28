data "aws_iam_role" "docker_role" {
  name = "Terraformadmin"  # Replace with the actual role name
}


resource "aws_iam_instance_profile" "example" {
  name = "instance-profile-docker" # Replace with a name
  role = data.aws_iam_role.docker_role.name
}

resource "aws_instance" "docker" {
  ami                    = local.ami_id
  instance_type          = "t3.medium"
  vpc_security_group_ids = [aws_security_group.allow_all_docker.id]
  iam_instance_profile = aws_iam_instance_profile.example.name
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }

  user_data = file("docker.sh")

  tags = {
    Name = "docker_instance_terraform"
  }
}


resource "aws_security_group" "allow_all_docker" {
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
    Name = "allow-all-docker"
  }

}

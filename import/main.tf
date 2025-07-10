resource "aws_instance" "linux_tf_import" {
  ami = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0d6a10b945732f352"]

  tags = {
    Name = "linux_tf_import"
  }
}
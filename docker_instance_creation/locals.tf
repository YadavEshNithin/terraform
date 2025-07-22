locals {
  # sg_id = [aws_security_group.allow_all.id]
  ami_id = data.aws_ami.joindevops.id
}
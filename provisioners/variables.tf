variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "ami value for devops practice"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "instance type value"
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name    = "HelloWorld"
    Purpose = "variables_demo"
  }
}

variable "sg_name" {
  type    = string
  default = "allow-all"
}
variable "sg_description" {
  type    = string
  default = "allow-all traffic for instance"
}
variable "from_port" {
  type    = number
  default = 0
}
variable "to_port" {
  type    = number
  default = 0
}
variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "sg_tags" {
  type = map(string)
  default = {
    "name" = "allow-all"
  }

}
variable "environment" {
  type    = string
  default = "prod"
}


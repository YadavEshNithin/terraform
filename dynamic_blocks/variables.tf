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
  default = "var_files_allow-all"
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

variable "instances" {
  default = ["mongodb", "mysql", "redis", "rabbitmq"]
  # type = map(string)
  # default = {
  #   "mongodb" = "t2.micro"
  #   "mysql" = "t2.micro"
  #   "redis" = "t2.micro"
  #   "rabbitmq" = "t2.micro"
  # }
}

variable "zone_id" {
  default = "Z06785221SBGYOQ3RLYGM"
}

variable "domain_name" {
  default = "rshopdaws84s.site"
}

variable "instance_ports" {
  type = list(map(number))

  default = [
    {
      from_port = 22
      to_port   = 22
    },
    {
      from_port = 80
      to_port   = 80
    },
    {
      from_port = 8080
      to_port   = 8080
    },
  ]

}
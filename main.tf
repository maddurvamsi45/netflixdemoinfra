provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-01a00762f46d584a1"
  instance_type          = "c7i-flex.large"
  key_name               = "mumbai"
  vpc_security_group_ids = ["sg-0b669fbe4dbdca725"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}

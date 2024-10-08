terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "Anbu-Aws-server" {
  ami = "ami-0e1a3a59369c81682"
  instance_type = "t2.micro"
  key_name = "anburaj-import"

  tags = {
    Name = "Anburaj-DevOps-batch-server"
    env = "Production"
    owner = "Anburaj"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is Anbu aws -jekins created file ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}


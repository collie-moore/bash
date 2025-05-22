provider "aws" {
  profile = "mooretech"
  region  = "eu-north-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# VPC
data "aws_vpc" "default" {
  default = true
}

# Security Group
data "aws_security_group" "default" {
  id = "sg-0c5a510dd0ac354b4"
}

# Subnet
data "aws_subnet" "default" {
  id = "subnet-0012aff8454f21ce8"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Output to get the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
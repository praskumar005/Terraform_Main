provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "ec2" {

ami = var.ami_id
instance_type = var.instance_type ? t2.micro : t2.medium
key_name = var.key_name
tags = {
Name = "Terraform-Instance"
}
}

output "instance_public_ip" {   #instance_public_ip optional we can use any output variable name in place of this
  value = aws_instance.ec2.public_ip
}

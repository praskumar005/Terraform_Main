#ProviderSection
provider "aws" {
  region = "us-east-1"
}
#ResourceSection
resource "aws_instance" "ec2" {
  ami           = "ami-0cca150d127c2216f"
  instance_type = "t2.micro"
  key_name      = "OSI_Key"
  tags = {
    Name = "Test-Instance"
  }
  root_block_device {
    volume_size = 8
  }
}

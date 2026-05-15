#EC2 Instance Creation with SG attached
resource "aws_instance" "ec2" {
  ami           = "ami-0cca150d127c2216f"
  instance_type = "t2.micro"
  key_name      = "OSI_Key"
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.aws_sg.id]
  count = 1 #Specify as per the requirement
  tags = {
    Name = "Test-Instance"
  }
  root_block_device {
    volume_size = 8
  }
}

resource "aws_security_group" "aws_sg" {

  name        = "terraform-sg"
  description = "This SG is for terraform created instances"

  # Inbound Rule for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound Rule for HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow All Traffic
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-sg"
  }
}

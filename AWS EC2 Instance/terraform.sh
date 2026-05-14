# Ubuntu/Debian
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# CentOS/RHEL
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

# Amazon Linux
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install terraform

# Terraform Version Check
terraform -version

#Example Response
#Terraform v1.15.3
#on linux_amd64

# To install the AWS CLI, run the following commands.
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# AWS CLI Version Check
aws --version
#Example Response 
#aws-cli/2.34.47 Python/3.14.4 Linux/6.8.0-1044-azure exe/x86_64.ubuntu.24

# Configure the AWS CLI
$ aws configure
AWS Access Key ID [None]: "Access-key"
AWS Secret Access Key [None]: "Secret-Key"
Default region name [None]: "Region-Name" # Optional-> Enter to skip
Default output format [None]: "json" # Optional-> Enter to skip

# Check AWS CLI Autenticated with your AWS Account
$ aws s3 ls

#It will give prompt the list of S3 buckets present in your AWS account and this is the way we can confirm AWS CLI is Autenticated successfully

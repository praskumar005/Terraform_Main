**Terraform Variables Concept:**
---------------------------------------
In Terraform, variables are used to make code reusable and flexible.

**Instead of hardcoding values like:**

AMI ID
Instance Type
Region
Key Name

we use variables.

**Why Variables?**

**Without variables:**

instance_type = "t2.micro"

Hardcoded value.

If you want another instance type:

Need to edit code again

**With variables:**

instance_type = var.instance_type

Now value can change dynamically.

**Basic Variable Syntax:**

**Step 1 — Create Variable**

variable "instance_type" {
  default = "t2.micro"
}

**Step 2 — Use Variable**

instance_type = var.instance_type

**Complete Example**
-------------------------------------------------------
**#variables.tf**
------------------------
variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0cca150d127c2216f"
}

variable "key_name" {
  default = "OSI_Key"
}

**# main.tf**
-----------------------
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ec2" {

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "Terraform-Server"
  }
}


**Terraform File Structure**

**Typical structure:**

terraform-project/
│
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf

terraform.tfvars File - Used to provide variable values separately.

**#terraform.tfvars**
------------------------
aws_region   = "us-east-1"
instance_type = "t2.micro"
ami_id       = "ami-0cca150d127c2216f"
key_name     = "OSI_Key"

**Types of Variables**
Type	        Example
string	      "t2.micro"
number	      2
bool	        true
list	        ["a","b"]
map	          {env="dev"}

**Example — String Variable**

variable "environment" {
  type    = string
  default = "dev"
}

**Example — Number Variable**

variable "disk_size" {
  type    = number
  default = 20
}

**Example — Boolean Variable**

variable "enable_monitoring" {
  type    = bool
  default = true
}

**Example — List Variable**

variable "ports" {
  type    = list(number)
  default = [22, 80, 443]
}

**Example — Map Variable**

variable "tags" {
  type = map(string)

  default = {
    Environment = "Dev"
    Owner       = "Prashanth"
  }
}

**Variable Priority Order**

Terraform checks values in this order:

1. Command  line
2. .tfvars   file
3. Environment variables
4. Default value

**Passing Variables from Command Line**

    $ terraform apply -var="instance_type=t3.medium"

**Environment Variable Method**

Linux:
    $ export TF_VAR_instance_type="t2.micro"

Terraform automatically reads it.

**Input Variables Without Default**

variable "instance_type" {
  type = string
}

Terraform asks during execution:

Enter a value:

**Local Variables**

Used for internal calculations.

locals {
  server_name = "Dev-Server"
}

Usage:

Name = local.server_name

**Output Variables**

Used to display information.

outputs.tf
output "instance_public_ip" {
  value = aws_instance.ec2.public_ip
}

After apply:

instance_public_ip = 13.xx.xx.xx

**Real-Time Example**

Suppose:

Dev uses t2.micro
Prod uses t3.large

Only variable changes:

instance_type = "t3.large"

No code rewrite needed.

**Best Practices:**
Use Separate Files

File	              Purpose
main.tf	            Resources
variables.tf	      Variables
terraform.tfvars	  Values
outputs.tf	        Outputs

**Recommended Naming**

Good:
instance_type
aws_region
key_name

Avoid:
x
a1
temp

**Sensitive Variables**

Hide passwords/secrets.

variable "db_password" {
  sensitive = true
}

**Validate Variables**

variable "instance_type" {

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Invalid instance type."
  }
}

**Useful Terraform Commands**

Format files:
    $ terraform fmt

Validate:
    $ terraform validate

Plan:
    $ terraform plan

Apply:
    $ terraform apply
    
**Official Documentation**
https://developer.hashicorp.com/terraform/language/values/variables?utm_source=chatgpt.com
https://developer.hashicorp.com/terraform/language/values/variables?utm_source=chatgpt.com#declaring-an-input-variable

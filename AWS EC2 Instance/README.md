**AWS EC2 Instance Creation — Step-by-Step Guide (Manual Method)**

**What is an EC2 Instance?**

--> An EC2 instance is a virtual server in Amazon Web Services.
--> You can use it to host applications, websites, databases, Jenkins servers, Boomi Molecules, APIs, and more.

**Think of it like:**

Physical Server → Traditional Data Center
EC2 Instance → Virtual Cloud Server in AWS
Basic AWS Concepts You Should Know

**1. Region**

--> A geographical location where AWS has data centers.

**Examples:**

ap-south-1 → Mumbai
us-east-1 → Virginia

--> Choose the nearest region for lower latency.

**2. Availability Zone (AZ)**

--> Each region contains multiple data centers.

**Example:**

ap-south-1a
ap-south-1b

--> Used for High Availability.

**3. AMI (Amazon Machine Image)**

--> Template used to create the server OS.

**Examples:**

Ubuntu
Amazon Linux
Red Hat
Windows Server

**4. Instance Type**

**Defines:**

--> CPU
--> RAM
--> Network performance

**Examples:**

--> t2.micro → Free tier
--> t3.medium
--> m5.large

**5. Key Pair**

--> Used for SSH login.

**Linux:**

 $ ssh -i key.pem ubuntu@public-ip

--> Without the key pair, you cannot log in.

**6. Security Group**

--> Acts like a firewall.

**Controls:**

--> SSH access
--> HTTP/HTTPS
--> Custom ports

**Example:**

**Port**	  **Purpose**
22	          SSH
80	          HTTP
443	          HTTPS
8080	        Jenkins

**7. EBS Volume**

--> Storage attached to EC2.

**Like:**

--> Hard Disk
--> SSD
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

**Step-by-Step EC2 Instance Creation**
**Step 1 — Login to AWS Console**

Open:

AWS Console

Login with your AWS account.

**Step 2 — Open EC2 Dashboard**

Search:

EC2

Click:

Amazon EC2

**Step 3 — Launch Instance**

Click:

Launch Instance

**Step 4 — Give Instance Name**

Example:

Dev-Server

Naming helps identify servers easily.

Examples:

Jenkins-Server
Boomi-Test
Nginx-LB

**Step 5 — Choose Operating System (AMI)**

Example:

Ubuntu Server 22.04
Amazon Linux 2023

Recommended for beginners:

Ubuntu Server

**Step 6 — Choose Instance Type**

For practice:

t2.micro

Free tier eligible.

Basic Notes:

Type	Usage
t2.micro	Small testing
t3.medium	Medium workloads
m5.large	Production

**Step 7 — Create or Select Key Pair**
Create New Key Pair

Choose:

Create new key pair

Example:

dev-key

Format:

.pem

Download it safely.

Important:

Never share .pem file
Store securely
Required for SSH

**Step 8 — Configure Network Settings**
Allow SSH

Enable:

Allow SSH traffic

Source:

My IP

This allows only your system to connect.

Optional Rules
HTTP

Port:

80
HTTPS

Port:

443
Jenkins

Port:

8080

**Step 9 — Configure Storage**

Default:

8 GB

Can increase:

20 GB
50 GB
100 GB

Storage Types:

Type	    Description
gp2/gp3	  SSD
io1/io2	  High performance

**Step 10 — Launch Instance**

Click:

Launch Instance

AWS now creates the VM.

**Step 11 — View Running Instance**

Go to:

Instances

You will see:

Instance ID
Public IP
Private IP
Status

Wait until:

Running

**Step 12 — Connect to Instance**
Linux/Mac SSH

Move key:

 $ chmod 400 dev-key.pem

Connect:

 $ ssh -i dev-key.pem ubuntu@PUBLIC-IP

Example:

 $ ssh -i dev-key.pem ubuntu@13.233.xx.xx
 
**Step 13 — Verify Server**

Run:

 $ hostname

Check OS:

 $ cat /etc/os-release

Check memory:

 $ free -h

Check disk:

 $ df -h

Install Basic Packages

Update server:

 $ sudo apt update -y

Install nginx:

 $ sudo apt install nginx -y

Start nginx:

 $ sudo systemctl start nginx

Enable nginx:

 $ sudo systemctl enable nginx

Access Website

Open browser:

http://PUBLIC-IP

You should see:

Welcome to nginx

**Important EC2 Concepts**

Public IP

Used for internet access.

Example:

13.x.x.x

Private IP

Internal AWS communication.

Example:

172.31.x.x

Used between:

App server
DB server
Load balancer

**Stop vs Terminate**
Action	    Meaning
Stop	      Server OFF
Start	      Server ON
Terminate	  Permanent delete

**Common Beginner Mistakes**

1. Security Group Missing Port 22

SSH won't work.

2. Wrong Username

OS	            Username
Ubuntu	        ubuntu
Amazon Linux	  ec2-user
CentOS	        centos

3. PEM File Permission Error

Fix:
 $ chmod 400 key.pem
 
4. Instance in Private Subnet

No internet access.As it does not have public IP by default, So we can access this Instance through Bastion Host/Jump Server located in Public Subnet.

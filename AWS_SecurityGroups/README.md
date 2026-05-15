**AWS Security Group Manual Creation — Step-by-Step**
-----------------------------------------------------

What is a Security Group?

A Security Group in Amazon Web Services acts like a virtual firewall for EC2 instances.

**It controls:**

Incoming traffic (Inbound Rules)
Outgoing traffic (Outbound Rules)

**Example:**

Allow SSH on port 22
Allow HTTP on port 80
Block unwanted traffic

Basic Security Group Concepts

Term	            Meaning
Inbound Rules	    Incoming traffic to server
Outbound Rules	  Traffic leaving server
Port	            Communication channel
Protocol	        TCP/UDP
Source	          Who can access
Destination	      Where traffic goes

**Common Ports**
Port	      Service
22	        SSH
80	        HTTP
443	        HTTPS
8080	      Jenkins
9090	      Boomi Molecule
3306	      MySQL
5432	      PostgreSQL

**Step-by-Step Manual Security Group Creation**
--------------------------------------------------------
**Step 1 — Login to AWS Console**

Open:

AWS Console

**Step 2 — Open EC2 Dashboard**

Search:

EC2

Open:

Amazon EC2

**Step 3 — Navigate to Security Groups**

Left Menu:

Network & Security → Security Groups

**Step 4 — Click Create Security Group**

Click:

Create security group

**Step 5 — Enter Basic Details**

Security Group Name

Example:

Web-Server-SG
Description

Example:

Security group for web server access
Select VPC

Choose your VPC.

Example:

Default VPC

or custom VPC.

**Step 6 — Configure Inbound Rules**

**Allow SSH**

Field	    Value
Type	    SSH
Protocol	TCP
Port	    22
Source	  My IP

Purpose:

Remote Linux login

**Allow HTTP**

Field	    Value
Type	    HTTP
Protocol	TCP
Port	    80
Source	  Anywhere

Purpose:

Website access

**Allow HTTPS**

Field	    Value
Type	    HTTPS
Protocol	TCP
Port	    443
Source	  Anywhere

Purpose:

Secure website access

**Jenkins Example**

Field	    Value
Type	    Custom TCP
Port	    8080
Source	  My IP

**Boomi Molecule Example**

Field	    Value
Type	    Custom TCP
Port	    9090
Source	  Internal CIDR

**Step 7 — Configure Outbound Rules**

Default:

Allow All Traffic

Usually sufficient for beginners.

**Step 8 — Create Security Group**

Click:

Create security group

Security Group is now ready.

**Attach Security Group to EC2**

During EC2 Creation

Select SG under:

Network Settings
Existing EC2 Instance

**Step 1**

Go to:

Instances

**Step 2**

Select instance

**Step 3**

Choose:

Actions → Security → Change security groups

**Step 4**

Attach SG

**Real-Time Example Architecture:**

Internet
   |
Security Group
   |
EC2 Instance

**Example:**

Port 80 → Website
Port 22 → Admin SSH
Port 443 → HTTPS

Important Security Notes
Avoid This in Production     0.0.0.0/0 for SSH

Reason:

Anyone on internet can try SSH login

Better:

My IP

**Best Practice Examples**
Service	      Recommended Source
SSH	          My IP
HTTP	        Anywhere
HTTPS	        Anywhere
DB Ports	    Private CIDR only

**Verify Security Group Rules**

Linux Server Check

Check listening ports:

  $ sudo netstat -tulnp

or:

  $ ss -tulnp
  
**Test Connectivity**

**SSH Test**
  $ ssh -i key.pem ubuntu@PUBLIC-IP
  
**HTTP Test**

**Browser:**

--> http://PUBLIC-IP

**Within VM:**
  $ curl -v http://host-IP:port
  
**Common Beginner Mistakes**

**1. Port Not Opened**

Example:
Jenkins running on 8080
SG missing 8080 rule

Result:
Site can't be reached

**2. Wrong Source CIDR**

Example:
192.168.1.0/24
instead of your actual IP.

**3. Instance and SG in Different VPC**

Security group won't attach.

**Security Group vs NACL**

Feature	        Security Group	        NACL
Level	          Instance	              Subnet
Stateful	      Yes	                    No
Easier	        Yes	                    Medium

**Recommended Practice**

Create separate SGs:

Web Server SG
Jenkins SG
Database SG
Load Balancer SG
Boomi Molecule SG

**Example Production Setup**
Server	          Ports
Load Balancer	    80,443
App Server	      8080
DB Server	        3306 private only

**Useful AWS Documentation**
https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html?utm_source=chatgpt.com
https://docs.aws.amazon.com/ec2/?utm_source=chatgpt.com

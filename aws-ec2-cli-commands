#!/bin/bash

# AWS CLI Commands Script for EC2, VPC, Subnet, Security Group, and Related Tasks

### Set these variables before running the script ###
AMI_ID="ami-0abcdef1234567890"
KEY_NAME="MyKeyPair"
INSTANCE_TYPE="t2.micro"
CIDR_BLOCK="10.0.0.0/16"
SUBNET_CIDR="10.0.1.0/24"
AZ="us-east-1a"
PORT=22
PROFILE=""  # optional: add --profile your-profile-name if needed

echo "========== EC2 Commands =========="

# List EC2 instances
aws ec2 describe-instances $PROFILE

# Launch EC2 instance
# (replace placeholders with actual IDs)
# aws ec2 run-instances --image-id $AMI_ID --count 1 --instance-type $INSTANCE_TYPE \
#   --key-name $KEY_NAME --security-group-ids sg-xxxxxxxx --subnet-id subnet-xxxxxxxx $PROFILE

# Start / Stop / Terminate instances
# aws ec2 start-instances --instance-ids i-xxxxxxxx $PROFILE
# aws ec2 stop-instances --instance-ids i-xxxxxxxx $PROFILE
# aws ec2 terminate-instances --instance-ids i-xxxxxxxx $PROFILE

# Check instance status
# aws ec2 describe-instance-status --instance-ids i-xxxxxxxx $PROFILE

echo "========== VPC Commands =========="

# Create VPC
# VPC_ID=$(aws ec2 create-vpc --cidr-block $CIDR_BLOCK --query 'Vpc.VpcId' --output text $PROFILE)
# echo "Created VPC: $VPC_ID"

# List VPCs
aws ec2 describe-vpcs $PROFILE

# Delete VPC (example)
# aws ec2 delete-vpc --vpc-id vpc-xxxxxxxx $PROFILE

echo "========== Subnet Commands =========="

# Create subnet
# SUBNET_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $SUBNET_CIDR --availability-zone $AZ \
#   --query 'Subnet.SubnetId' --output text $PROFILE)
# echo "Created Subnet: $SUBNET_ID"

# List subnets
aws ec2 describe-subnets $PROFILE

# Delete subnet
# aws ec2 delete-subnet --subnet-id subnet-xxxxxxxx $PROFILE

echo "========== Internet Gateway =========="

# Create and attach internet gateway
# IGW_ID=$(aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text $PROFILE)
# aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $IGW_ID $PROFILE
# echo "Internet Gateway ID: $IGW_ID"

# Describe internet gateways
aws ec2 describe-internet-gateways $PROFILE

echo "========== Route Table =========="

# Create route table
# RTB_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID --query 'RouteTable.RouteTableId' --output text $PROFILE)

# Create route to internet
# aws ec2 create-route --route-table-id $RTB_ID --destination-cidr-block 0.0.0.0/0 \
#   --gateway-id $IGW_ID $PROFILE

# Associate route table with subnet
# aws ec2 associate-route-table --subnet-id $SUBNET_ID --route-table-id $RTB_ID $PROFILE

echo "========== Security Group =========="

# Create security group
# SG_ID=$(aws ec2 create-security-group --group-name MySecurityGroup --description "My security group" \
#   --vpc-id $VPC_ID --query 'GroupId' --output text $PROFILE)
# echo "Security Group ID: $SG_ID"

# Allow SSH
# aws ec2 authorize-security-group-ingress --group-id $SG_ID \
#   --protocol tcp --port $PORT --cidr 0.0.0.0/0 $PROFILE

# List security groups
aws ec2 describe-security-groups $PROFILE

echo "========== Elastic IP =========="

# Allocate Elastic IP
# EIP_ALLOC_ID=$(aws ec2 allocate-address --query 'AllocationId' --output text $PROFILE)

# Associate with EC2 instance
# aws ec2 associate-address --instance-id i-xxxxxxxx --allocation-id $EIP_ALLOC_ID $PROFILE

# Release Elastic IP
# aws ec2 release-address --allocation-id $EIP_ALLOC_ID $PROFILE

echo "========== Key Pairs =========="

# Create key pair
# aws ec2 create-key-pair --key-name $KEY_NAME $PROFILE

# List key pairs
aws ec2 describe-key-pairs $PROFILE

# Delete key pair
# aws ec2 delete-key-pair --key-name $KEY_NAME $PROFILE

echo "========== Output Format Example =========="

# List EC2 instances in table format
aws ec2 describe-instances --output table $PROFILE

echo "✅ Script complete. Uncomment and customize commands before running full infrastructure setup."

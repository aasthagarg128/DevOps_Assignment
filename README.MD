## Overview

This project implements a basic distributed inference system using Terraform and AWS EC2. The setup separates public and private components so that only the API is exposed to the internet, while worker nodes remain inside a private subnet.

The API is built with Flask and communicates with worker nodes using gRPC. Requests are received by the API, forwarded to a worker for processing, and the result is returned to the client.

The goal of this project is to demonstrate a simple, reproducible infrastructure setup with secure networking and end-to-end communication.

## API Usage

## Curl Command

curl -X POST http://<API_PUBLIC_IP>:5000/infer \
  -H "Content-Type: application/json" \
  -d '{"text": "hello world"}'


## Sample Request
{
  "text": "hello world"
}


## Sample Response
{
  "result": "processed: hello world"
}


## Redeployment Instructions
## Prerequisites

AWS account
AWS CLI configured
Terraform installed


## Steps
Clone the repository:
git clone https://github.com/aasthagarg128/DevOps_Assignment.git
cd distributed-inference-system/terraform
Configure variables:
cp terraform.tfvars.example terraform.tfvars

## Edit values as needed:

-region        = "us-east-1"
-instance_type = "t2.micro"
-key_name      = "your-key"
-Initialize and deploy:
-terraform init
-terraform plan
-terraform apply

Type yes when prompted.

Get the API public IP:
terraform output
Test using the curl command above.

## Production Considerations
Use IAM roles and restrict SSH access through a bastion host
Enable HTTPS using a load balancer
Store secrets securely instead of keeping them in files
Add monitoring, logging, and basic health checks

## Scaling for Larger Models
Move to GPU-based instances for heavier workloads
Add more workers and scale horizontally
Introduce batching or caching to improve performance
Consider using a queue for better load handling

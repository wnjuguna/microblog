# Microblog CI/CD pipeline
[![Build Status](http://ec2-54-186-233-125.us-west-2.compute.amazonaws.com:8080/buildStatus/icon?job=microblog%2Fmaster)](http://ec2-54-186-233-125.us-west-2.compute.amazonaws.com:8080/job/microblog/job/master/)

This project creates a pipeline to build and deploy a flask webapp on AWS Elastic Kubernetes Service. The microblog application project from https://github.com/miguelgrinberg/microblog 

## Project structure
### src/
- Contains the microblog source code

### ansible/roles/buildservers/tasks
- Tasks to be executed by Jenkins pipeline

### ansible/roles/buildservers/templates
- kubectl configuration
- kubernetes config for microblog microservice

### ansible/roles/buildservers/files/cloudformation
- Cloudformation templates for EKS stacks

## Requirements:
### Jenkins server
- ec2 instance running Ubuntu 18.04
- Jenkins and python3 installed
- iam instance role with access to: cloudformation, vpc, EKS, IAM, ECR

## How to deploy the application
### make setup: 
Prepares environment on the Jenkins server to build the microblog container. This involves installing:
- python libraries
- Linting tools
- Docker environment
- aws-iam-authenticator
- Docker-credential-helper
- Ansible

### make build:
Performs linting of the following files:
- ansible playbooks
- Dockerfile
- Cloudformation templates

If linting is successful, the microblog webapp will be packaged as a container.

### make push: 
Creates a repository on Elastic Container Registry and pushes the latest image

### make deploy:
Uses cloudformation to create the resources required for the cluster:
 - VPC including iam-roles, subnets, internet gateways and routing tables
 - EKS cluster and iam-roles
 - EKS-nodegroups in multiple availability zones

Uses the k8s api to create a deployment and a service for the microblog app

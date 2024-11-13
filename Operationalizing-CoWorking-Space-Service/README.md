# Coworking Space Service Extension
The Coworking Space Service is a set of APIs that enables users to request one-time tokens and administrators to authorize access to a coworking space. This service follows a microservice pattern and the APIs are split into distinct services that can be deployed and managed independently of one another.

For this project, you are a DevOps engineer who will be collaborating with a team that is building an API for business analysts. The API provides business analysts basic analytics data on user activity in the service. The application they provide you functions as expected locally and you are expected to help build a pipeline to deploy it in Kubernetes.

## Getting Started

### Setup

#### 1. Configure EKS
1. Navigate to [eks]() folder.
1. Run `eks-create.sh`.
1. Run `eks-enable-cloudwatch.sh` to enable CloudWatch Container Insights.

#### 1. Configure the Database
1. Navigate to [database]() folder.
1. Run `apply.sh` to create database and associate services.
1. Navigate to [db]() folder.
1. Run `seed.sh` to insert data.

#### 1. Configure the Codebuild and ECR
1. Navigate to [pipeline]() folder.
1. Run
```
    terraform init \
    terraform apply
```

#### 1. Configure the Analytics Application
1. Navigate to [eks]() folder.
1. Run `eks-deploy-application.sh`

### Deliverables
1. `Dockerfile`
2. Screenshot of AWS CodeBuild pipeline
3. Screenshot of AWS ECR repository for the application's repository
4. Screenshot of `kubectl get svc`
5. Screenshot of `kubectl get pods`
6. Screenshot of `kubectl describe svc <DATABASE_SERVICE_NAME>`
7. Screenshot of `kubectl describe deployment <SERVICE_NAME>`
8. All Kubernetes config files used for deployment (ie YAML files)
9. Screenshot of AWS CloudWatch logs for the application

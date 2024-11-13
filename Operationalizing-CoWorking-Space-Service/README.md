# Coworking Space Service
The Coworking Space Service is a set of APIs that enables users to request one-time tokens and administrators to authorize access to a coworking space. This service follows a microservice pattern and the APIs are split into distinct services that can be deployed and managed independently of one another.

For this project, you are a DevOps engineer who will be collaborating with a team that is building an API for business analysts. The API provides business analysts basic analytics data on user activity in the service. The application they provide you functions as expected locally and you are expected to help build a pipeline to deploy it in Kubernetes.

## Getting Started

### Setup

#### 1. Configure EKS
1. Navigate to [eks](./infrastructure/eks) folder.
1. Run `eks-create.sh`.
1. Run `eks-enable-cloudwatch.sh` to enable CloudWatch Container Insights.

#### 2. Configure the Database
1. Navigate to [database](./infrastructure/database) folder.
1. Run `apply.sh` to create database and associate services.
1. Navigate to [db](./db) folder.
1. Run `seed.sh` to insert data.

#### 3. Configure the Codebuild and ECR
1. Navigate to [pipeline](./infrastructure/pipeline) folder.
1. Run
```
    terraform init \
    terraform apply
```

#### 4. Configure the Analytics Application
1. Navigate to [eks](./infrastructure/eks) folder.
1. Run `eks-deploy-application.sh`

### Deliverables
1. [Dockerfile](./analytics/Dockerfile)
2. Screenshot of AWS CodeBuild pipeline: [1](./screenshoots/codebuild-1.png), [2](./screenshoots/codebuild-2.png)
3. Screenshot of AWS ECR repository for the application's repository: [link](./screenshoots/ecr-docker-image.png)
4. Screenshot of `kubectl get svc`: [link](./screenshoots/kubectl-get-svc.png)
5. Screenshot of `kubectl get pods`: [link](./screenshoots/kubectl-get-pods.png)
6. Screenshot of `kubectl describe svc postgresql-service`: [link](./screenshoots/kubectl-describe-svc-postgresql-service.png)
7. Screenshot of `kubectl describe deployment coworking`: [link](./screenshoots/kubectl-describe-deployment-coworking.png)
8. All Kubernetes config files used for deployment (ie YAML files): [link](./deployment)
9. Screenshot of AWS CloudWatch logs for the application: [link](./screenshoots/CloudWatch-Container-Insights-logs.png)

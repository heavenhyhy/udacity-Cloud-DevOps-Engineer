# Movie Picture Pipeline

You've been brought on as the DevOps resource for a development team that manages a web application that is a catalog of Movie Picture movies. They're in dire need of automating their development workflows in hopes of accelerating their release cycle. They'd like to use Github Actions to automate testing, building and deploying their applications to an existing Kubernetes cluster.

The team's project is comprised of 2 applications.

1. A frontend UI written in Typescript, using the React framework
2. A backend API written in Python using the Flask framework.

You'll find 2 folders, one named `frontend` and one named `backend`, where each application's source code is maintained. Your job is to use the team's [existing documentation](#frontend-development-notes) and create CI/CD pipelines to meet the teams' needs.

## Deliverables

### Frontend

1. [Frontend CI]()
1. [Frontend CD]()
1. Example run:
   1. Run CI when create PR for FE code change:
   1. Run CI manually:
   1. Run CD when merge to `main` branch:
   1. Run CD manually:

### Backend

1. [Backend CI]()
1. [Backend CD]()
1. Example run:
   1. Run CI when create PR for FE code change:
   1. Run CI manually:
   1. Run CD when merge to `main` branch:
   1. Run CD manually:

### AWS resource

1. [Backend ECR]()
1. [Frontend ECR]()

### Application

1. URL:
2. [Screenshoot]()

## Terraform Destroy

Need to manually delete ALB for BE and FE before destroy TF.

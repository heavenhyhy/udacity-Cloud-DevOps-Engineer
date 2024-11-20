# Movie Picture Pipeline

You've been brought on as the DevOps resource for a development team that manages a web application that is a catalog of Movie Picture movies. They're in dire need of automating their development workflows in hopes of accelerating their release cycle. They'd like to use Github Actions to automate testing, building and deploying their applications to an existing Kubernetes cluster.

The team's project is comprised of 2 applications.

1. A frontend UI written in Typescript, using the React framework
2. A backend API written in Python using the Flask framework.

You'll find 2 folders, one named `frontend` and one named `backend`, where each application's source code is maintained. Your job is to use the team's [existing documentation](#frontend-development-notes) and create CI/CD pipelines to meet the teams' needs.

## Deliverables

### Frontend

1. [Frontend CI](/.github/workflows/frontend-ci.yaml)
1. [Frontend CD](/.github/workflows/frontend-cd.yaml)
1. Example run:
   1. Run CI when create PR for FE code change: https://github.com/heavenhyhy/udacity-Cloud-DevOps-Engineer/actions/runs/11926622837
   1. Run CI manually: https://github.com/heavenhyhy/udacity-Cloud-DevOps-Engineer/actions/runs/11908310033
   1. Run CD when merge to `main` branch: https://github.com/heavenhyhy/udacity-Cloud-DevOps-Engineer/actions/runs/11926661333
   1. Run CD manually: https://github.com/heavenhyhy/udacity-Cloud-DevOps-Engineer/actions/runs/11926548629

### Backend

1. [Backend CI](/.github/workflows/backend-ci.yaml)
1. [Backend CD](/.github/workflows/backend-cd.yaml)
1. Example run:
   1. Run CI when create PR for BE code change: https://github.com/heavenhyhy/udacity-Cloud-DevOps-Engineer/actions/runs/11926622846
   1. Run CI manually: https://github.com/heavenhyhy/udacity-Cloud-DevOps-Engineer/actions/runs/11910297285
   1. Run CD when merge to `main` branch: https://github.com/heavenhyhy/udacity-Cloud-DevOps-Engineer/actions/runs/11926661329
   1. Run CD manually: https://github.com/heavenhyhy/udacity-Cloud-DevOps-Engineer/actions/runs/11925850037

### AWS resource

1. [Backend ECR](/Movie-Picture-Pipeline/screenshoots/ecr-be.png)
1. [Frontend ECR](/Movie-Picture-Pipeline/screenshoots/ecr-fe.png)

### Application

1. URL: http://a7161a1edeca745f3b0c958c7b29b127-964878460.us-east-1.elb.amazonaws.com
2. [Screenshoot](/Movie-Picture-Pipeline/screenshoots/app.png)

## Terraform Destroy

Need to manually delete ALB for BE and FE before destroy TF.

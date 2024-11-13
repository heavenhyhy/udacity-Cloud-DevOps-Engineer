#!/bin/bash

aws iam --region us-east-1 attach-role-policy \
--role-name eksctl-sangtd2-nodegroup-my-nodes-NodeInstanceRole-D0MNESvAxja0 \
--policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy

aws eks --region us-east-1 create-addon --addon-name amazon-cloudwatch-observability --cluster-name sangtd2

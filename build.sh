#!/bin/bash

set -e
REPOSITORY_HOST=595508394202.dkr.ecr.us-west-2.amazonaws.com
REPOSITORY_URI=$REPOSITORY_HOST/syn-bastion
aws ecr get-login-password  | docker login --username AWS --password-stdin $REPOSITORY_HOST
docker build -t $REPOSITORY_URI:latest .
docker push $REPOSITORY_URI:latest

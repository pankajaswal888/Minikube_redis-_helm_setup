#!/bin/bash

# Define the deployment name and container name
DEPLOYMENT_NAME="my-redis-deploy"
CONTAINER_NAME="my-redis-deploy"

# Define the Redis key and value
REDIS_KEY="OxKey"
REDIS_VALUE="OxValue"

# Get the name of the pod running the Redis container
POD_NAME=$(kubectl get pods -l app=$DEPLOYMENT_NAME -o jsonpath="{.items[0].metadata.name}")

# Set the Redis key-value pair using the redis-cli command
kubectl exec $POD_NAME -c $CONTAINER_NAME -- redis-cli SET $REDIS_KEY $REDIS_VALUE


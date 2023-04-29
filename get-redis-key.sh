#!/bin/bash

# Define the deployment name and container name
DEPLOYMENT_NAME="my-redis-deploy"
CONTAINER_NAME="my-redis-deploy"

# Define the Redis key
REDIS_KEY="OxKey"

# Get the name of the pod running the Redis container
POD_NAME=$(kubectl get pods -l app=$DEPLOYMENT_NAME -o jsonpath="{.items[0].metadata.name}")

# Get the value of the Redis key using the redis-cli command
REDIS_VALUE=$(kubectl exec $POD_NAME -c $CONTAINER_NAME -- redis-cli GET $REDIS_KEY)

# Print the value of the Redis key
echo "The value of the Redis key $REDIS_KEY is: $REDIS_VALUE"


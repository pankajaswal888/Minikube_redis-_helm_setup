#!/bin/bash

# Add the Redis Helm repository
helm repo add bitnami https://charts.bitnami.com/bitnami

# Update Helm
helm repo update

# Install Redis with Helm
helm install redis bitnami/redis

# Verify Redis is running
kubectl get pods -l app=redis -w


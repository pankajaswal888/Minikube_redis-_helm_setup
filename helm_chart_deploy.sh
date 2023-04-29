#!/bin/bash

# Define the chart name and namespace
CHART_NAME="my-redis-deploy"
NAMESPACE="default"

# Add the Helm repository if needed
helm repo add bitnami https://charts.bitnami.com/bitnami

# Install the chart with Helm
helm install $CHART_NAME bitnami/$CHART_NAME --namespace $NAMESPACE


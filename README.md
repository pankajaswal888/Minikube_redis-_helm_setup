# Minikube_redis-_helm_setup
# script to deploy minikube , redis helm chart on the cluster
## PART 1 -> script to deploy a minikube cluster
Save this script to a file, say minikube-setup.sh. Then make it executable by running
run the script with ./minikube-setup.sh
This script will install the required dependencies, including kubectl and Minikube, start a Minikube cluster using the none driver (which runs Kubernetes directly on your host machine), and verify that the cluster is running by checking the cluster information with kubectl cluster-info.

##PART 2 -> script to deploy redis server helm chart on the cluster
Save this script to a file, say redis-deploy.sh.
run the script with ./redis-deploy.sh
This script will add the Bitnami Redis Helm repository, update Helm, install Redis using the bitnami/redis chart, and verify that the Redis pods are running by watching the output of kubectl get pods -l app=redis -w.

##PART 3 -> helm chart defining a deployment with a single container, that container should have the ability to connect to the redis server ( ie: redis - #Official Image | Docker Hub ). The deployment should remain up, allowing the user to “exec” into the container to run redis commands.
First, create a new directory for the chart
mkdir my-redis-deploy
cd my-redis-deploy
Create a new values.yaml file in the my-redis-deploy directory.
Create a new deployment.yaml file in the my-redis-deploy/templates directory.
This file defines a Kubernetes deployment that includes a single container running the Redis image. The container has two environment variables (REDIS_HOST and REDIS_PORT) that specify the Redis server to connect to. The command is set to "sh -c 'tail -f /dev/null'" to keep the container running indefinitely.
Finally, create a new Chart.yaml file in the my-redis-deploy directory.
To install the chart & To verify that the deployment is running, run the following command -> kubectl get pods
To connect to the container and run Redis commands, run the following command -> kubectl exec -it <pod-name> sh
Replace <pod-name> with the name of the Redis pod. This command opens a shell in the container where you can run Redis command -> 
redis-cli -h $REDIS_HOST -p $REDIS_PORT

##PART 4 -> script to deploy the above helm chart on the cluster
Save this script to a file, say helm_chart_deploy.sh
run the script with -> ./helm_chart_deploy.sh
This script installs the chart named my-redis-deploy from the Bitnami Helm repository into the default namespace of your Kubernetes cluster.

##PART 5 -> script to “exec” to the deployment and set a new key in the redis server (OxKey) with a value (OxValue)
Save this script to a file, say set-redis-key.sh
run the script with ./set-redis-key.sh
This script connects to the Redis container in the deployment named my-redis-deploy, sets the Redis key OxKey to the value OxValue, and exits.

##PART 6 -> script to “exec” to the deployment and get the value of the key (OxKey) and print it back out
Save this script to a file, say get-redis-key.sh
run the script with ./get-redis-key.sh
This script connects to the Redis container in the deployment named my-redis-deploy, retrieves the value of the Redis key OxKey, and prints it out.


======= THE END =======================


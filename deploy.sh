KUBERNETES_REGISTRY=aws-ecr
DOCKER_ECR=992549445923.dkr.ecr.us-east-1.amazonaws.com
DOCKER_USERNAME=AWS
DOCKER_EMAIL=your@email.com
REGION=us-east-1
DOCKER_SECRET=$(aws ecr --region=$REGION get-authorization-token --output text \
	--query authorizationData[].authorizationToken | base64 -d | cut -d: -f2)



kubectl delete secrets ${KUBERNETES_REGISTRY} 2> /dev/null
kubectl create secret docker-registry ${KUBERNETES_REGISTRY} \
--docker-server=${DOCKER_ECR} \
--docker-username=${DOCKER_USERNAME} \
--docker-password=${DOCKER_SECRET} \
--docker-email=${DOCKER_EMAIL}

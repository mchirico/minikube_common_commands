#!/bin/bash
#helm install --replace --name nodechart ./nodechart --set service.type=NodePort
# If you need to delete:
helm delete nodechart
kubectl delete -f pig.za261.io/nginxauth-service.yaml
kubectl delete -f pig.za261.io/nginxauth-ingress.yaml
kubectl delete -f pig.za261.io/nginxauth-deployment.yaml
#
# Watch services
# k get service -w

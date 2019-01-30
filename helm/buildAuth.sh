#!/bin/bash
helm install --replace --name nodechart ./nodechart --set service.type=NodePort
# If you need to delete:
# helm delete nodechart
k apply -f pig.za261.io/nginxauth-service.yaml
k apply -f pig.za261.io/nginxauth-ingress.yaml
k apply -f pig.za261.io/nginxauth-deployment.yaml
#
# Watch services
# k get service -w

## Trouble Shooting


First see if you can connect.

```bash
minikube service list
|-------------|----------------------|-------------------------|
|  NAMESPACE  |         NAME         |           URL           |
|-------------|----------------------|-------------------------|
| default     | kubernetes           | No node port            |
| development | clojure-server       | http://10.240.0.2:32266 |
| development | ssh-server           | http://10.240.0.2:30280 |
| kube-system | kube-dns             | No node port            |
| kube-system | kubernetes-dashboard | No node port            |
|-------------|----------------------|-------------------------|
```


Above you can see ssh is running on `10.240.0.2:30280`, so try ssh on this ip and port.

```bash
ssh root@10.240.0.2 -p 30280


```



```bash
kubectl get service ssh-server -o yaml


apiVersion: v1
kind: Service
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"labels":{"run":"ssh-server"},"name":"ssh-server","namespace":"development"},"spec":{"ports":[{"port":22,"targetPort":22}],"selector":{"run":"ssh-server"},"type":"LoadBalancer"}}
  creationTimestamp: 2019-01-23T12:49:27Z
  labels:
    run: ssh-server
  name: ssh-server
  namespace: development
  resourceVersion: "72185"
  selfLink: /api/v1/namespaces/development/services/ssh-server
  uid: 51958eac-1f0d-11e9-b9ad-42010af00002
spec:
  clusterIP: 10.111.14.217
  externalTrafficPolicy: Cluster
  ports:
  - nodePort: 30280
    port: 22
    protocol: TCP
    targetPort: 22
  selector:
    run: ssh-server
  sessionAffinity: None
  type: LoadBalancer
status:
  loadBalancer: {}
```



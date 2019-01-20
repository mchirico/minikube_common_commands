
## Access the Service

The following will list everything:

```bash
minikube service list

|-------------|----------------------|-----------------------------|
|  NAMESPACE  |         NAME         |             URL             |
|-------------|----------------------|-----------------------------|
| default     | kubernetes           | No node port                |
| development | clojure-server       | http://192.168.99.100:32360 |
| kube-system | default-http-backend | http://192.168.99.100:30001 |
| kube-system | heapster             | No node port                |
| kube-system | kube-dns             | No node port                |
| kube-system | kubernetes-dashboard | No node port                |
| kube-system | metrics-server       | No node port                |
| kube-system | monitoring-grafana   | http://192.168.99.100:30002 |
| kube-system | monitoring-influxdb  | No node port                |
| kube-system | tiller-deploy        | No node port                |
|-------------|----------------------|-----------------------------|
```

If you just want the specific address, use the following:

```bash

minikube service -n development clojure-server --url

http://192.168.99.100:32360

```


## Scale

```bash
kubectl scale --replicas=3 -f clojure-deployment.yaml
```

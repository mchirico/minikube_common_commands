## Intro

### Namespace

You can run this in a `development` namespace. But, to do that you must create the namespace.

```bash
cd minikube_common_commands/namespace
kubectl apply -f develop.json

```

Switch to the namespace, or make sure you're in the correct namespace.

```bash
kubens development
```



You'll also need to make sure secrets are active in the `development` namespace.

```bash
kubectl create secret docker-registry gcr-json-key \
--docker-server=us.gcr.io \
--docker-username=_json_key \
--docker-password="$(cat ~/.pullK/mchirico-gcrpull2.json)" \
--docker-email=mchirico@gmail.com


```

```bash
kubectl patch serviceaccount default \
-p '{"imagePullSecrets": [{"name": "gcr-json-key"}]}'
```

### Deployment

In the directory `minikube_common_commands/docker/grpc`

```bash
kubectl apply -f deployment-development.json

```



### Port forward

```bash
kubectl -n development port-forward grpc-server-8ddcc8c67-bcfm6 8087:8082
```


### Test

```bash
curl -X POST \
   http://localhost:8087/rpc \
   -H 'cache-control: no-cache' \
   -H 'content-type: application/json' \
   -d '{
   "method": "JSONServer.GiveBookDetail",
   "params": [{
   "Id": "1234"
   }],
   "id": "1"
}'

```

You should get back the following:

```bash
{"result":{"Id":"1234","Name":"In the sunburned country","Author":"Bill Bryson"},"error":null,"id":"1"}
```
## Commands

[Good Starting Tutorial](https://docs.bitnami.com/kubernetes/how-to/create-your-first-helm-chart/)

[More Advanced](https://docs.helm.sh/chart_template_guide/#the-chart-template-developer-s-guide)


```bash
helm create mychart
```

```bash
helm install --name example ./mychart --set service.type=NodePort
```

```bash
helm delete example
```




```bash
helm install --replace --name example ./mychart --set service.type=NodePort
```

## Create Separate Example

First create a new chart.

```bash
helm create gogchart
cd gogchart
```



For this example, the `gogchart/templates/service.yaml` template will be modified.

Note below **service2** was added, for the 2nd port.

```text
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.externalPort }}
      targetPort: {{ .Values.service.internalPort }}
      protocol: TCP
      name: {{ .Values.service.name }}
    - port: {{ .Values.service2.externalPort }}
      targetPort: {{ .Values.service2.internalPort }}
      protocol: TCP
      name: {{ .Values.service2.name }}
```


Note we've also added **service2** to `gogchart/values.yaml`, making two ports available 9100 and 8080.

```text
service:
  name: node
  type: ClusterIP
  externalPort: 9100
  internalPort: 9100
service2:
  name: gog
  type: ClusterIP
  externalPort: 8080
  internalPort: 8080

```


Now install 


```bash
helm install --replace --name gogexample ./gogchart --set service.type=NodePort
```


This can also be packaged and installed.

```bash
helm package ./gogchart

helm install --replace --name gogexample gogchart-0.1.0.tgz --set service.type=NodePort


```

## GCP:  Google Cloud Platform

Walking through creating a helm chart for an existing deployment.
The existing deployment can be found in directory `gcpnginx_raw`.


First you'll need to create a cluster.  This example is based
upon [Google's helm concourse](https://cloud.google.com/solutions/continuous-integration-helm-concourse) example.

```bash

gcloud container clusters create concourse --machine-type=g1-small --image-type ubuntu --num-nodes=2  --scopes cloud-source-repos-ro,storage-full

# If you don't have a default region
gcloud container clusters create concourse --machine-type=g1-small --zone us-central1-c --image-type ubuntu  --scopes cloud-source-repos-ro,storage-full


# Note, you may need to resize later
gcloud container clusters resize concourse --size=3 

```

### Init Helm in GCP

```bash
gcloud container clusters get-credentials concourse

kubectl create clusterrolebinding user-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value account)
kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding tiller-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl create clusterrolebinding --clusterrole=cluster-admin --serviceaccount=default:default concourse-admin
helm init --service-account=tiller
helm repo update

export PROJECT=$(gcloud info --format='value(config.project)')
export BUCKET=$PROJECT-helm-repo
helm plugin install https://github.com/viglesiasce/helm-gcs.git --version v0.1.1
gsutil mb -l us-central1 gs://$BUCKET
helm gcs init gs://$BUCKET


```

### Raw Helm

We'll start with an empty helm project and build from there.

```bash
helm create gcpnginx

```

Now give it a dry run:

```bash
helm install --dry-run --debug ./gcpnginx
```


You want to try previous examples

```bash
helm install --replace --name gogexample ./gogchart --set service.type=NodePort

# If you need to delete...
helm delete gogexample

```


But, you'll need a way to troubleshoot services.


```bash
kubectl run -i --tty ssh --image=us.gcr.io/mchirico/ssh:pub -- /bin/bash
```

## Auth Project

Once it's done, you'll be able to authenticate using
the following [url](https://bit.ly/2sMoemb).

### Easy Install (buildAuth.sh)
```bash
buildAuth.sh
```

### Manual Steps


```bash
helm install --replace --name nodechart ./nodechart --set service.type=NodePort

# If you need to delete...
helm delete nodechart

```

```bash
cd pig.za261.io
k apply -f nginxauth-service.yaml
k apply -f nginxauth-ingress.yaml
k apply -f nginxauth-deployment.yaml

```

### Configuration Check:

```bash
k get service
NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)                         AGE
kubernetes           ClusterIP      10.3.240.1     <none>          443/TCP                         4h
nginxauth            LoadBalancer   10.3.255.175   35.202.88.179   443:31614/TCP,9100:32446/TCP    16m
nginxauth-server     NodePort       10.3.255.246   <none>          8080:31116/TCP                  47m
nodechart-gogchart   NodePort       10.3.254.109   <none>          9100:31950/TCP,4591:31355/TCP   1h

```

## Trouble Shooting

```bash
k get po
NAME                                  READY     STATUS    RESTARTS   AGE
nginxauth-5ddb6fb7cb-sjkz5            1/1       Running   0          6m
nginxauth-5ddb6fb7cb-vvjqw            1/1       Running   0          6m
nodechart-gogchart-6b568c79b9-2hk7r   1/1       Running   0          1h

```

Attach to node

```bash
kubectl exec -it nginxauth-5ddb6fb7cb-vvjqw -- /bin/bash

```
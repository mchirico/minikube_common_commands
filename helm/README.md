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
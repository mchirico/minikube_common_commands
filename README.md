# minikube_common_commands

## Pulling GCP Images

To pull images from Google Cloud Platform, GCP, you'll need to create and
download a gcr-json-key.  

<br>

[<img src="https://raw.githubusercontent.com/mchirico/mchirico.github.io/master/p/images/selected_role.png" alt="drawing" width="550"/>](https://player.vimeo.com/video/312422908)

<br>

Below I've download and named by key `mchirico-gcrpull2.json` and copied it into 
a directory I created called `.pullK`

<br>


```bash
kubectl create secret docker-registry gcr-json-key \
--docker-server=us.gcr.io \
--docker-username=_json_key \
--docker-password="$(cat ~/.pullK/mchirico-gcrpull2.json)" \
--docker-email=mchirico@gmail.com
```

Next, you'll need to update the default serviceaccount.

```bash
kubectl patch serviceaccount default \
-p '{"imagePullSecrets": [{"name": "gcr-json-key"}]}'

```

Now, if you run `minikube dashboard`, you'll see the following entry.

```bash
minikube dashboard
```


<img src="https://raw.githubusercontent.com/mchirico/mchirico.github.io/master/p/images/minikube_dashBoard.png" alt="drawing" width="750"/>



## Without VM Support

[ref](https://github.com/kubernetes/minikube#linux-continuous-integration-without-vm-support)

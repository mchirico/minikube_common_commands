

```bash
minikube service list
|-------------|----------------------|--------------------------------|
|  NAMESPACE  |         NAME         |              URL               |
|-------------|----------------------|--------------------------------|
| cadvisor    | cadvisor-server      | http://10.240.0.2:32282        |
| default     | kubernetes           | No node port                   |
| development | clojure-server       | http://10.240.0.2:32266        |
| development | gog-server           | http://10.240.0.2:32382        |
|             |                      | http://10.240.0.2:31846        |
| development | ssh-server           | http://10.240.0.2:30280        |
| kube-system | kube-dns             | No node port                   |
| kube-system | kubernetes-dashboard | No node port                   |
| kube-system | prometheus           | No node port                   |
|-------------|----------------------|--------------------------------|
```


## Example SSH config

```bash
Host mce
Hostname 104.147.23.112
        User banderson
        ControlMaster auto
        ForwardX11Trusted yes
        ForwardX11 yes
        LocalForward 32282 10.240.0.2:32282
        IdentityFile /Users/banderson/.ssh/google_compute_engine
        StrictHostKeyChecking no
        ServerAliveInterval 30

```

Above note the line `LocalForward 32282 10.240.0.2:32282`
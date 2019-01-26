#!/bin/bash
scp mce:./pig.za261.io/*.pem .
docker build -t us.gcr.io/mchirico/nginxpig:proxy0 .
docker push us.gcr.io/mchirico/nginxpig:proxy0

#!/bin/bash
docker build -t us.gcr.io/mchirico/ssh:pub .
docker push us.gcr.io/mchirico/ssh:pub
#docker run -p 8022:22 --rm -it  us.gcr.io/mchirico/ssh:pub

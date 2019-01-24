#!/bin/bash
docker build -t us.gcr.io/mchirico/gog:node .
docker push us.gcr.io/mchirico/gog:node
# docker run -p 8080:8080 -p 9100:9100 --rm -it us.gcr.io/mchirico/gog:node

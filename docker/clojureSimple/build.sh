#!/bin/bash
docker build -t us.gcr.io/mchirico/clojure:inst .

docker push us.gcr.io/mchirico/clojure:inst

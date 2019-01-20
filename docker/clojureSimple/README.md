
```bash
wget https://github.com/mchirico/clojure_slop/archive/http.tar.gz
tar -xzf http.tar.gz

cd clojure_slop-http/
lein uberjar

cp target/clojure_slop-0.0.1-SNAPSHOT-standalone.jar ../app.jar
cd ..

```


```bash
docker build -t us.gcr.io/mchirico/clojure:inst .


```
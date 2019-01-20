FROM clojure AS builder

RUN git clone --depth=1 https://github.com/mchirico/clojure_slop.git \
  && cd clojure_slop \
  && lein uberjar 

#------  Slim version -----
FROM openjdk:8-jre-slim
RUN mkdir -p /run
COPY --from=builder /tmp/clojure_slop/target/clojure_slop-0.0.1-SNAPSHOT-standalone.jar /run/app.jar
CMD java -jar /run/app.jar

# To build this:
# docker build -t us.gcr.io/mchirico/clojure:inst .

# To run this:
# docker run -p 8080:8080 --rm -it  us.gcr.io/mchirico/clojure:inst 

# To push
# docker push us.gcr.io/mchirico/clojure:inst 

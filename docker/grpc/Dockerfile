FROM golang:1.11.4-alpine

RUN apk update && apk upgrade && apk add --no-cache bash git

RUN go get -u github.com/gorilla/mux && \
    go get -u github.com/gorilla/rpc && \
    go get -u github.com/micro/protobuf/protoc-gen-go && \
    go get -u github.com/mchirico/gog/cmd/gog  && \
    go get -u github.com/mchirico/gog/cmd/grpc

CMD grpc

# To build this:
# docker build -t mchirico/gog:grpc .
#  or
# docker build -t us.gcr.io/mchirico/gog:inst .

# To run this: 
# docker run -p 8082:8082 --rm -it mchirico/gog:grpc
#  or
# docker run -p 8082:8082 --rm -it us.gcr.io/mchirico/gog:inst


# To push
# docker push mchirico/gog:grpc
# or
# docker push us.gcr.io/mchirico/gog:inst

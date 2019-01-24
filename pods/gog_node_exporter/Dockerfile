FROM golang:1.11.4-alpine AS builder

RUN apk update && apk upgrade && apk add --no-cache bash git

RUN go get -u github.com/gorilla/mux && \
    go get -u github.com/gorilla/rpc && \
    go get -u github.com/micro/protobuf/protoc-gen-go && \
    go get -u github.com/mchirico/gog/cmd/gog  && \
    go get -u github.com/mchirico/gog/cmd/grpc && \
    go get -u github.com/prometheus/node_exporter

RUN cd /go/src/github.com/prometheus/node_exporter && go build
RUN cd /go/src/github.com/mchirico/gog/cmd/gog/ && go build


FROM golang:1.11.4-alpine

COPY --from=builder /go/src/github.com/prometheus/node_exporter/node_exporter /go/bin/node_exporter
COPY --from=builder /go/src/github.com/mchirico/gog/cmd/gog/gog /go/bin/gog

COPY exec.go /go/src/exec.go

CMD ["/usr/local/go/bin/go","run","/go/src/exec.go"]



# To build this:
# docker build -t us.gcr.io/mchirico/gog:node .


# To run this: 
# docker run -p 8080:8080 -p 9100:9100 --rm -it us.gcr.io/mchirico/gog:node


# To push
# docker push us.gcr.io/mchirico/gog:node

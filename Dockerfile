FROM golang:1.12.5-alpine

RUN apk update && apk upgrade && apk add --no-cache bash git

RUN go get github.com/gin-gonic/gin

ENV SOURCES /go/src/inven-order/
COPY . /go/src/inven-order/

RUN cd /go/src/inven-order && CGO_ENABLED=0 go build

WORKDIR /go/src/inven-order/
CMD /go/src/inven-order/inven-order
EXPOSE 8282
FROM golang:1.15 as build

WORKDIR /go/src/pingPong
RUN go get -u github.com/gin-gonic/gin
COPY pingPong.go .
RUN go build
RUN ls -l

# Now copy it into our base image.
FROM gcr.io/distroless/base
COPY --from=build /go/src/pingPong/pingPong /

ENTRYPOINT ["/pingPong"]
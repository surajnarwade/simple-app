FROM golang:1.11.4
WORKDIR /go/src/github.com/mchmarny/simple-app/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -v -o app

FROM scratch
COPY --from=0 /go/src/github.com/mchmarny/simple-app/app .
ENTRYPOINT ["/app"]

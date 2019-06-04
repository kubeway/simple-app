FROM registry.cn-hangzhou.aliyuncs.com/kstarter/golang:1.11.4
WORKDIR /go/src/github.com/mchmarny/simple-app/
COPY . .
RUN CGO_ENABLED=0 go build -v -o app

FROM alpine:3.9
COPY --from=0 /go/src/github.com/mchmarny/simple-app/app .
ENTRYPOINT ["/app"]

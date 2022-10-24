FROM golang:alpine AS builder

RUN apk --no-cache add git ca-certificates

WORKDIR $GOPATH/src/github.com/rwv/custom-caddy

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . $GOPATH/src/github.com/rwv/custom-caddy

RUN go build -ldflags="-s -w" -o /caddy

# Second Stage
FROM alpine

COPY --from=builder /caddy /caddy

CMD ["/caddy"]

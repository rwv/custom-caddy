FROM golang:alpine AS builder

RUN apk --no-cache add git ca-certificates

WORKDIR $GOPATH/src/github.com/rwv/custom-caddy

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . $GOPATH/src/github.com/rwv/custom-caddy

RUN go build -o /usr/bin/caddy

# Second Stage
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

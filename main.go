// See https://github.com/caddyserver/caddy/blob/master/cmd/caddy/main.go
package main

import (
	caddycmd "github.com/caddyserver/caddy/v2/cmd"

	// plug in Caddy modules here
	_ "github.com/caddyserver/caddy/v2/modules/standard"

	_ "github.com/caddy-dns/cloudflare"
	_ "github.com/ss098/certmagic-s3"
)

func main() {
	caddycmd.Main()
}

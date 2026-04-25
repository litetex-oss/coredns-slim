package main

//go:generate go run directives_generate.go

import (
	_ "github.com/coredns/coredns/core/plugin" // Plug in CoreDNS.
	"github.com/coredns/coredns/coremain"
)

func main() {
	coremain.Run()
}

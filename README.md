[![DockerHub](https://img.shields.io/docker/pulls/litetex/coredns-slim.svg?logo=docker&logoColor=white&color=blue)](https://hub.docker.com/r/litetex/coredns-slim)

# coredns-slim
A slim fork / build of [coredns](https://github.com/coredns/coredns).

## Why?

While inspecting coredns I found out that the binary is huge (60MB) and contains a lot of 3rd party vendor code that I will likely never need.

After removing this code the binary was 2x smaller.

Additionally some other essential plugins that are somehow not part of the core distribution have been added.

## What is changed?

* Removed plugins
  * for propietary platforms introduced by "lobbying"
    * route53 (AWS)
    * azure
    * clouddns (GCP)
    * etc (SkyDNS)
    * Nomad (Hashicorp)
  * Niche/Experimental
    * grpc
    * geoip
    * chaos
  * All kubernetes plugins
* Added plugins
  * [blocklist](https://github.com/relekang/coredns-blocklist)
* Other changes
  * Patched [TTL bug](https://github.com/coredns/coredns/issues/7846) that never allows it to be higher than 1h

## How?
The updating logic can be found in the [sidecar repo](https://github.com/litetex-oss/coredns-slim-manager).

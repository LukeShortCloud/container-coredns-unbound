# container-coredns-unbound

A container image that provides CoreDNS compiled with the Unbound plugin. This provides a recursive DNS caching server. The image is based on Debian 11 Bullseye.

## Usage

Default configuration:

```
$ docker run -p 53:53/tcp -p 53:53/udp --name coredns-unbound coredns-unbound:1.8.3-1
```

Custom `Corefile` configuration (an example is provided in this repository):

```
$ docker run -p 55:53/tcp -p 53:53/udp -v "$(pwd):/etc/coredns" -d --name coredns-unbound coredns-unbound:1.8.3-1
```

## Build

An automated build script is provided to download the source code, patch it to workaround a known [bug](https://github.com/miekg/unbound/issues/13) with the Unbound plugin, create an image with the build dependencies, and then compile the `coredns` binary.

```
$ ./build.sh
```

## Versioning

Example container tag: 1.8.3-1

-  `1.8.3` = The CoreDNS version.
-  `-1` = The release of container-coredns-unbound. If the container has changed but the CoreDNS version has not then this release number is increased by one. This is reset to `1` when the CoreDNS version is increased.

## License

Apache Software License v2.0.

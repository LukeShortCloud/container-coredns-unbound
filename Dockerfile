FROM debian:bullseye-slim

RUN apt-get update
RUN apt-get -y install ca-certificates && update-ca-certificates
RUN apt-get -y install libunbound8
RUN apt-get clean

ADD coredns-source/coredns /coredns

EXPOSE 53 53/udp

ENTRYPOINT ["/coredns"]

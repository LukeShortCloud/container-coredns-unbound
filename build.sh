export COREDNS_VER=1.8.3
rm -r -f v${COREDNS_VER}.tar.gz coredns-source
wget https://github.com/coredns/coredns/archive/v${COREDNS_VER}.tar.gz
tar -x -v -f v${COREDNS_VER}.tar.gz
mv coredns-${COREDNS_VER} coredns-source
patch -p0 < Makefile.patch
docker image build --file Dockerfile.build --tag coredns-unbound-build:1.8.3-1 .
docker run --rm -v "$(pwd)/coredns-source:/coredns-source" coredns-unbound-build:1.8.3-1

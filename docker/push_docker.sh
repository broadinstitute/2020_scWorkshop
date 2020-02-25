#!/bin/sh

set -ev

VERSION=`cat VERSION.txt`

docker push kdgosik/2020scworkshop:${VERSION}
docker push kdgosik/2020scworkshop:latest

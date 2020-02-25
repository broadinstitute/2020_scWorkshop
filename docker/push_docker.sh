#!/bin/sh

set -ev

VERSION=`cat VERSION.txt`

docker push kdgosik/scellbern2019:${VERSION}
docker push kdgosik/scellbern2019:latest

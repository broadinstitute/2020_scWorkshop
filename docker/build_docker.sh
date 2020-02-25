#!/bin/sh

set -ev

VERSION=`cat VERSION.txt`

docker build -t kdgosik/scellbern2019:$VERSION .
docker build -t kdgosik/scellbern2019:latest .


#!/bin/sh

set -ev
cd ..
VERSION=`cat VERSION.txt`

docker build -t kdgosik/2020scworkshop:$VERSION .
docker build -t kdgosik/2020scworkshop:latest .


#!/bin/sh

PORT=$1

# -v $PWD:/home/rstudio \
docker run --rm -ti \
-v $PWD:/home/rstudio \
-e PASSWORD=train \
-p $PORT:8787 kdgosik/2020scworkshop
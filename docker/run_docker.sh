#!/bin/sh

# -v $PWD:/home/rstudio \
docker run --rm -ti \
-e DISABLE_AUTH=true \
-p 8787:8787 kdgosik/2020scworkshop
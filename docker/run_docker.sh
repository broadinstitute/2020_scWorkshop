#!/bin/sh
cd ..

docker run --rm -ti -v $PWD:/home/rstudio \
-e DISABLE_AUTH=true \
-p 8787:8787 kdgosik/2020scworkshop


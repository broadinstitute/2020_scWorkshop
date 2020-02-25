#!/bin/sh

docker run --rm -ti -v `pwd`:/home/rstudio -e USER=training -e PASSWORD=training -p 10000:8787 kdgosik/scell $*


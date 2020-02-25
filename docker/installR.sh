#!/bin/bash

# Extract OS distribution codename
export DISTRIBUTION_CODENAME=`grep DISTRIB_CODENAME /etc/lsb-release | cut -c 18-`

# Appends the CRAN repository to your sources.list file
sh -c 'echo "deb https://cloud.r-project.org/bin/linux/ubuntu $DISTRIBUTION_CODENAME/" >> /etc/apt/sources.list'

# Add GPG key of Michael Rutter the Ubuntu archives CRAN maintainer
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

apt-get update
apt-get install -y r-base r-base-dev

FROM rocker/tidyverse:latest
MAINTAINER kgosik@broadinstitute.org

#########
### Install Utilities
#########
RUN apt-get update && apt-get install -y gcc g++ perl python3 python3-pip python-dev \
                                        automake make cmake less vim nano fort77 \
                                        wget git curl bsdtar bzip2 gfortran unzip ftp \
                                        libpng-dev libjpeg-dev \
                                        texlive-latex-base default-jre build-essential \
                                        libbz2-dev liblzma-dev libtool \
                                        libxml2 libxml2-dev zlib1g-dev
                                        # libdb-dev libglu1-mesa-dev zlib1g-dev  \
                                        # libncurses5-dev libghc-zlib-dev libncurses-dev \
                                        # libpcre3-dev libxml2-dev \
                                        # libblas-dev libzmq3-dev libreadline-dev libssl-dev \
                                        # libcurl4-openssl-dev libx11-dev libxt-dev \
                                        # x11-common libcairo2-dev \
                                        # libreadline6-dev libgsl0-dev \
                                        # libeigen3-dev libboost-all-dev \
                                        # libgtk2.0-dev xvfb xauth xfonts-base \
                                        # apt-transport-https libhdf5-serial-dev

RUN cp $(which tar) $(which tar)~ \
    && ln -sf $(which bsdtar) $(which tar)


## Get Course Materials https://github.com/broadinstitute/2020_scWorkshop.git
# RUN git clone https://github.com/broadinstitute/2020_scWorkshop.git /home/rstudio/2020_scWorkshop/


# ## Install R packages
# RUN Rscript /home/rstudio/2020_scWorkshop/docker/install.R
COPY install.R /usr/local/src
RUN Rscript /usr/local/src/install.R


RUN R --no-save -e 'reticulate:::install_miniconda(path = "/home/ubuntu/.local/share/r-miniconda", force = TRUE)'
RUN export PATH=/home/ubuntu/.local/share/r-miniconda/bin:$PATH && \
  conda init bash && \
  conda create -n seurat -c conda-forge python=3 umap-learn leidenalg -y
# conda install -n seurat -c conda-forge umap-learn leidenalg -y


# ## Install Python Requirements
# COPY requirements.txt /usr/local/src
# RUN pip3 install -r /usr/local/src/requirements.txt

# ## FASTQC
# COPY fastqc_v0.11.8.zip /usr/local/src/fastqc_v0.11.8.zip
# RUN cd /usr/local/src/ && \
#  unzip fastqc_v0.11.8.zip && \
#  cd /


# ## IGViewer
# COPY IGV_2.4.19.zip /usr/local/src/IGV_2.4.19.zip
# RUN cd /usr/local/src && \
#    unzip IGV_2.4.19.zip && \
#    cd /


# ## cellranger
# COPY cellranger-3.1.0.tar.gz /usr/local/src
# RUN cd /usr/local/src && \
#  tar -xvzf cellranger-3.1.0.tar.gz && \
#  cd /

# COPY cellranger_count_3.0.2.sh /usr/local/src


# ## Alternatively, get STAR source using git
# RUN git clone https://github.com/alexdobin/STAR.git usr/local/src/STAR && \
#   cd /usr/local/src/STAR/source && \
#   make STAR && \
#   cd /


# RUN wget -O /usr/local/src/samtools-1.10.tar.bz2 https://github.com/samtools/samtools/releases/download/1.10/samtools-1.10.tar.bz2 && \
#   cd /usr/local/src && \
#   tar xvjf samtools-1.10.tar.bz2 && \
#   cd samtools-1.10 && \
#   ./configure --without-curses && \
#   make && make install && \
#   cd /
  
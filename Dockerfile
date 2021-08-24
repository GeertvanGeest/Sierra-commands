FROM rocker/r-ver:4.1.0

RUN apt-get update

RUN apt-get install -y \
libbz2-dev \
libz-dev \
libclang-dev \
libxt6 \
libgl1-mesa-glx \
libcurl4-openssl-dev \
libglpk-dev \
libxml2-dev \
liblzma-dev

COPY install_packages.R .

RUN Rscript install_packages.R

COPY scripts/*.R /usr/local/bin

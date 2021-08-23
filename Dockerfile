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
libxml2-dev 

COPY install_rsamtools.R .

RUN Rscript install_rsamtools.R

COPY install_bioc_packages.R .

RUN Rscript install_bioc_packages.R

COPY install_sierra.R .

RUN apt-get install -y \
liblzma-dev

RUN Rscript install_sierra.R

RUN Rscript -e "install.packages('optparse')"

COPY FindPeaks.R /usr/local/bin

COPY CountPeaks.R /usr/local/bin

COPY MergePeakCoordinates.R /usr/local/bin

COPY AnnotatePeaksFromGTF.R /usr/local/bin
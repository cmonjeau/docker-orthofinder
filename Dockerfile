################################################
# Dockerfile to build OrthoFinder software
# Based on debian blast
################################################

# Set the base image to debian blast
FROM simonalpha/ncbi-blast-docker

LABEL version="0.7.1"

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive
ENV PACKAGES wget make gcc g++ mafft unzip python-pip python-dev libatlas-base-dev gfortran

ENV FASTTREE_URL http://www.microbesonline.org/fasttree/FastTree

ENV MCL_URL http://micans.org/mcl/src/mcl-14-137.tar.gz
ENV MCL_PATH /opt/mcl-14-137

ENV ORTHOFINDER_URL https://github.com/davidemms/OrthoFinder/archive/0.7.1.zip
ENV ORTHOFINDER_FILE_NAME 0.7.1.zip
ENV ORTHOFINDER_PATH /opt/OrthoFinder-0.7.1

################## Update & upgrade ######################

RUN apt-get update -y
RUN apt-get install -y ${PACKAGES}

################# Numpy / Scipy install ########################

RUN pip install numpy
RUN pip install scipy

################# Fastree install ########################

RUN wget -P /usr/local/bin ${FASTTREE_URL}

################# MCL install ########################

WORKDIR /opt
RUN wget ${MCL_URL} -O - | tar xvzf -
WORKDIR ${MCL_PATH}

RUN ./configure --prefix=/usr/local && make install

########################### orthoFinder install & run tests #############################

WORKDIR /opt
RUN wget ${ORTHOFINDER_URL} --no-check-certificate && unzip ${ORTHOFINDER_FILE_NAME}
ENV PATH "$PATH:${ORTHOFINDER_PATH}"

WORKDIR /root

RUN orthofinder.py -f ${ORTHOFINDER_PATH}/ExampleDataset/

########################## clean source file #################################

RUN rm -r /opt/0.7.1.zip

###############################################################

MAINTAINER Monjeaud Cyril <Cyril.Monjeaud@irisa.fr>

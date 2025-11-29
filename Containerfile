# container based on https://github.com/osqzss/LimeGPS
FROM docker.io/ubuntu:20.04

# adds add-apt-repository
RUN apt-get update && \
    apt-get install -y software-properties-common

# these only support up to Ubuntu 22.04 as of 29 Nov 2025
RUN add-apt-repository -y  ppa:myriadrf/drivers

# https://github.com/pothosware/PothosCore/wiki/Ubuntu
# these only support up to Ubuntu 20.04 as of 29 Nov 2025
RUN add-apt-repository -y ppa:pothosware/framework
RUN add-apt-repository -y ppa:pothosware/support

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    	    pothos-all \
    	    limesuite \
	    liblimesuite-dev \
	    limesuite-udev \
	    limesuite-images \
	    soapysdr-tools \
	    soapysdr-module-lms7

# https://wiki.myriadrf.org/Lime_Suite
RUN apt-get install -y \
    build-essential \
    git \
    make && \
    cd /opt && \
    git clone https://github.com/osqzss/LimeGPS && \
    cd /opt/LimeGPS && \
    make 

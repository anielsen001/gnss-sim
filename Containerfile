# container based on https://github.com/osqzss/LimeGPS
FROM docker.io/ubuntu:22.04


RUN apt-get update && \
    apt-get install -y software-properties-common

RUN add-apt-repository  ppa:myriadrf/drivers
#sudo add-apt-repository ppa:myriadrf/drivers


RUN apt-get update && \
    apt-get install -y \
    	    limesuite \
	    liblimesuite-dev \
	    limesuite-udev \
	    limesuite-images \
	    soapysdr \
	    soapysdr-module-lms7

	    
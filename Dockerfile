FROM nvidia/opencl:devel-ubuntu16.04

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
        build-essential \
        git \
        cmake \
        libboost-all-dev \
        ocl-icd-opencl-dev \
        ca-certificates

RUN cd /tmp/ \
    && git clone https://github.com/KhronosGroup/OpenCL-CLHPP.git \
    && cp -R /tmp/OpenCL-CLHPP/include /usr/

RUN mv /usr/include/CL/cl2.hpp /usr/include/CL/cl.hpp

#BASE IMAGE + PACKAGE
FROM aauno/base

#AUTHOR @vinayak
MAINTAINER @vinayak
# This is the base container for AAUNO

RUN apt-get update

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y --no-install-recommends git curl vim unzip openssh-client wget
RUN apt-get install -y --no-install-recommends build-essential cmake

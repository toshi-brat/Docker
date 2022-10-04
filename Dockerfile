#! Dockerfile for installing Java 1.9 and Python 2.7. and Sambamba 0.6.6 !#
  
# Pull base image.
FROM ubuntu:18.04
  
# Set maintainer.
LABEL  description=’Dockerfile for installing Java 1.8 and Python 2.7. and Sambamba 0.6.6’ \
maintainer=’Rosalind Franklin, Seven Bridges Genomics Inc., <rosalind.franklin@sbgenomics.com>’ \
  
# Define the commonly used JAVA_HOME variable.
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
  
# Install Java 1.9 and remove tmp files.
RUN apt-get update && apt-get install -y software-properties-common && \
        echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
        add-apt-repository -y ppa:webupd8team/java && \
        apt-get update && apt-get install -y oracle-java8-installer oracle-java8-set-default && \
        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/oracle-jdk8-installer
  
# Install Python 2.7 and pip and remove tmp files.
RUN apt-get update && apt-get install -y \
        python \
        python-pip && \
        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
# Define working directory.
WORKDIR /opt
  
# Install Sambamba 0.6.6 and remove tmp files.
RUN wget https://github.com/lomereiter/sambamba/releases/download/v0.6.6/sambamba_v0.6.6_linux.tar.bz2 && \
        tar -xjvf sambamba_v0.6.6_linux.tar.bz2 && \
        rm sambamba_v0.6.6_linux.tar.bz2 && \
        chmod +x sambamba_v0.6.6 && \
        ln -s /opt/sambamba_v0.6.6 /bin/sambamba_v0.6.6
  
# Copy Dockerfile and Changelog.
COPY Dockerfile /opt/
COPY Changelog /opt/

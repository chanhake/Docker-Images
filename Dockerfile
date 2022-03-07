FROM ubuntu:20.04

MAINTAINER tj <toconnor@fit.edu>

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

# apt-get installs
RUN apt-get update -y
RUN apt-get install -y \
    g++ \
    gcc \
    gdb \
    gdb-multiarch \
    gdbserver \ 
    git \
    make \
    man \
    nano \
    nasm \
    pkg-config \
    tmux \
    wget 

RUN apt-get install -y python3-pip
RUN apt-get install -y ruby

# python3 pip installs
RUN python3 -m pip install --no-cache-dir \
    angr \
    autopep8 \
    capstone \
    cython \
    keystone-engine \
    pefile \
    pwntools \
    qiling \
    unicorn \

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8 

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t crunch

WORKDIR /root/workspace
ENTRYPOINT ["/bin/zsh"]

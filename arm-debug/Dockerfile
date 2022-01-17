FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

# install all packages for arm debugging
RUN apt-get update -y && apt install -y build-essential \
    qemu-user gcc-arm-linux-gnueabi gcc-arm-linux-gnueabihf \
    gdb gdb-multiarch nano git tmux wget --fix-missing && \
    rm -rf /var/lib/apt/list/*

# unset the library path so you can force loading
RUN unset LD_LIBRARY_PATH

# install pwndbg for gdb
RUN git clone https://github.com/pwndbg/pwndbg
RUN cd pwndbg && ./setup.sh

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t robbyrussell

WORKDIR = "/root"
ENTRYPOINT ["/bin/zsh"]
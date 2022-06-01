FROM kalilinux/kali-rolling

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

# install all packages for arm debugging
RUN apt-get update -y && apt install -y build-essential file \
    qemu-user gcc-arm-linux-gnueabi gcc-arm-linux-gnueabihf \
    gdb gdb-multiarch gdbserver locales nano git tmux wget --fix-missing && \
    rm -rf /var/lib/apt/list/*

# unset the library path so you can force loading
RUN unset LD_LIBRARY_PATH

# install pwndbg for gdb
RUN git clone https://github.com/pwndbg/pwndbg
RUN cd pwndbg && ./setup.sh

## some cross-compilation stuff
RUN dpkg --add-architecture armhf && \
    dpkg --add-architecture armel && \
    dpkg --add-architecture i386 && \
    apt-get update -y && \
    #apt-get -y install libssl-dev:armhf libssl-dev:armel libc6:i386 libncurses5:i386 libstdc++6:i386 && \
    rm -rf /var/lib/apt/lists/*

# resolves issue with local environment
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8 

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t robbyrussell

WORKDIR /root/workspace
COPY bins /root/workspace/.

ENTRYPOINT ["/bin/zsh"]

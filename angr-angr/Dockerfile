FROM angr/angr

MAINTAINER tj <toconnor@fit.edu>

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

# apt-get installs
RUN apt-get update -y
RUN apt-get install -y \
    g++ \
    gcc \
    gcc-multilib \
    gdb \
    gdb-multiarch \
    git \
    make \
    man \
    nano \
    nasm \
    pkg-config \
    qemu-system-mipsel \
    tmux \
    wget 

RUN apt-get install -y ruby

# python3 pip installs
RUN python3 -m pip install --no-cache-dir \
    pefile \
    pwntools \
    qiling \
    r2pipe \
    ropgadget \
    ropper \
    sudo \
    unicorn \
    z3-solver \
    xortool

# install pwndbg
RUN cd /opt/ && git clone https://github.com/pwndbg/pwndbg && \
  cd pwndbg && \
  ./setup.sh

RUN apt-get -y install ruby-dev
# install one_gadget
RUN gem install one_gadget seccomp-tools && rm -rf /var/lib/gems/2.*/cache/*

# install radare
RUN wget https://github.com/radareorg/radare2/releases/download/4.4.0/radare2_4.4.0_amd64.deb && \
    dpkg -i radare2_4.4.0_amd64.deb && rm radare2_4.4.0_amd64.deb

# libc database
RUN cd /opt/ && \
    git clone --depth 1 https://github.com/niklasb/libc-database.git libc-database && \
    cd libc-database && \
    ./get ubuntu debian || echo "/libc-database/" > ~/.libcdb_path

# resolves issue with get
RUN apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8 

RUN apt-get -y install sudo
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t crunch

WORKDIR /home/angr/workspace

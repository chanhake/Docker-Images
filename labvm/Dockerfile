FROM kalilinux/kali-rolling

MAINTAINER tj <toconnor@fit.edu>

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

# apt-get installs
RUN apt-get update -y
RUN apt-get install -y afl-* \
    aircrack-ng \
    audacity \
    audispd-plugins \
    auditd \
    autoconf \
    bandit \
    binutils \
    binwalk \
    bison \
    build-essential \
    chaosreader \
    chkrootkit \
    cmake \
    crackle \
    dnscat2 \
    flawfinder \
    flex \
    forensics-all \
    g++ \
    gcc \
    gcc-multilib \
    gdb \
    gdb-multiarch \
    gdbserver \
    git \
    gnuradio \
    gqrx-sdr \
    iptables \
    jadx \
    kalibrate-rtl \
    kismet \
    kismet-plugins \
    libbluetooth-dev \
    libgcrypt-dev \
    libpcap-dev \
    librtlsdr-dev \
    libssl-dev \
    libtool \
    libusb-1.0-0-dev \
    make \
    man \
    mitmproxy \
    nano \
    nasm \
    net-tools \
    ngrep \
    pkg-config \
    powershell-empire \
    python2 \
    python2-dev \
    #python2-pip-whl \
    python3-bandit \
    python3-binwalk \
    python3-pip \
    python3-scapy \
    qemu-system-mipsel \
    rkhunter \
    ruby \
    ruby-dev \
    shellter \
    silenttrinity \
    snort \
    sox \ 
    sqlite3 \
    sqlmap \
    swig \
    tcpdump \
    tcpxtract \
    tempest-for-eliza \
    tmux \
    u-boot-tools \
    veil \
    veil-evasion \
    wget \
    wifite \
    zsh \
    zlib1g-dev

# python3 pip installs
RUN python3 -m pip install --no-cache-dir \
    angr \
    angrop \
    apscheduler \
    autopep8 \
    capstone \
    cython \
    flare-floss \
    keystone-engine \
    log_symbols \
    opencv-python \
    pandas \
    pebble \
    pefile \
    progress \
    pwntools \
    pybluez \
    qiling \
    r2pipe \
    ropgadget \
    ropper \
    scikit-learn \
    smmap2 \
    spinners \
    stego-lsb \
    sudo \
    unicorn \
    urh \
    z3-solver \
    xortool

# run dump1090 (ads-b)
RUN cd /opt && \
    git clone https://github.com/antirez/dump1090.git && \
    cd dump1090 && \
    make && \
    ln -sf /opt/dump1090/dump1090 /usr/local/bin/dump109

# install DidierStevensSuite (ole parsing)
RUN cd /opt/ && \
    git clone https://github.com/DidierStevens/DidierStevensSuite && \
    chmod +x /opt/DidierStevensSuite/oledump.py && \
    ln -sf /opt/DidierStevensSuite/oledump.py /usr/local/bin/oledump 

# install osquery
RUN cd /opt/ && \
    wget https://pkg.osquery.io/deb/osquery_4.6.0-1.linux_amd64.deb && \
    dpkg -I osquery_4.6.0-1.linux_amd64.deb

# install zeek
RUN cd /opt/ && \
    git clone --recursive https://github.com/zeek/zeek && \
    cd zeek && \
    ./configure && \
    make && \
    make install

# install rsactftool
RUN cd /opt/ && git clone https://github.com/Ganapati/RsaCtfTool

# install pcapfix 
RUN cd /opt && wget https://f00l.de/pcapfix/pcapfix-1.1.7.tar.gz

# install volatility
RUN cd /opt/ && \
    wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip && \
    unzip volatility_2.6_lin64_standalone.zip && \
    ln -sf /opt/volatility_2.6_lin64_standalone/volatility_2.6_lin64_standalone /usr/local/bin/volatility

# install gef for gdb
# RUN wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# install pwndbg
RUN cd /opt/ && git clone https://github.com/pwndbg/pwndbg && \
  cd pwndbg && \
  ./setup.sh

# firmwalker
RUN cd /opt/ && \
    git clone https://github.com/craigz28/firmwalker.git 
    #&& \
    #echo alias firmwalker="/opt/firmwalker/firmwalker.sh" >> /home/kali/.zshrc 

# install one_gadget
RUN gem install one_gadget seccomp-tools && rm -rf /var/lib/gems/2.*/cache/*

# install radare
RUN wget https://github.com/radareorg/radare2/releases/download/4.4.0/radare2_4.4.0_amd64.deb && \
    dpkg -i radare2_4.4.0_amd64.deb && rm radare2_4.4.0_amd64.deb

# install python2.7 pip
RUN cd /opt/ && \
    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && \
    python2 get-pip.py

# install python2.7 libs
RUN pip install setuptools \
    crypto \
    serial \
    pwntools \
    scapy \
    ipython \
    click==5.1 \
    pyusb==1.0.0 \
    tabulate==0.7.5 \
    six==1.10.0 \
    PySide2 \
    future \
    pyserial \
    numpy \
    importlib

# install boofuzz
RUN cd /opt/ && \
    git clone https://github.com/jtpereyda/boofuzz.git && \
    cd boofuzz && \
    python3 setup.py install

# install killerbee
RUN cd /opt/ && \
    git clone https://github.com/riverloopsec/killerbee && \
    cd killerbee && \
    python2 setup.py install 

# install rfcat
RUN cd /opt/ && \
    git clone https://github.com/atlas0fd00m/rfcat && \
    cd rfcat && \
    sed 's/ipython/#ipython/g' requirements.txt > requirements.mod && \
    mv requirements.mod requirements.txt && \
    python2 setup.py install 

# install KillerZee
RUN cd /opt/ && \
    git clone https://github.com/joswr1ght/killerzee && \
    cd killerzee && \
    python2 setup.py install 

# install z3sec
RUN cd /opt/ && \
    git clone https://github.com/IoTsec/Z3sec/ && \
    cd Z3sec && \
    python2 setup.py install

# install stego tools
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils \
                       apktool \
                       forensics-all \
                       foremost \
                       exiftool \
                       outguess \
                       pngtools \
                       pngcheck \
                       stegosuite \
                       hexedit \
                       autotools-dev \
                       automake \
                       libevent-dev \
                       bsdmainutils \
                       ffmpeg \
                       crunch \
                       cewl \
                       sonic-visualiser \
                       xxd \
                       tcpflow \
                       steghide \
                       stegsnow \
                       bison \
                       ffmpeg \
                       atomicparsley && \
    pip3 install python-magic && \
    pip install tqdm

# install stegsolve
RUN cd /opt && \
    wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar && \
    chmod +x stegsolve.jar && \
    mkdir bin && \
    mv stegsolve.jar bin/

# install jsteg
RUN wget -O /usr/local/bin/jsteg https://github.com/lukechampine/jsteg/releases/download/v0.3.0/jsteg-linux-amd64 && chmod +x /usr/local/bin/jsteg
RUN wget -O /usr/local/bin/slink https://github.com/lukechampine/jsteg/releases/download/v0.3.0/slink-linux-amd64 && chmod +x /usr/local/bin/slink

# install snow
RUN wget -O /usr/snow.tar.gz http://www.darkside.com.au/snow/snow-20130616.tar.gz
WORKDIR /usr
RUN tar -xvf snow.tar.gz
WORKDIR /usr/snow-20130616/
RUN make
RUN cp /usr/snow-20130616/snow /usr/local/bin/snow && chmod +x /usr/local/bin/snow

# libc database
RUN cd /opt/ && \
    git clone --depth 1 https://github.com/niklasb/libc-database.git libc-database && \
    cd libc-database && \
    ./get ubuntu debian || echo "/libc-database/" > ~/.libcdb_path

# copy how to heap
RUN cd /opt/ && \
    git clone --depth 1 https://github.com/shellphish/how2heap how2heap

# download auto-exploiter getsome.py
RUN cd /opt/ && \
    mkdir getsome && \
    cd getsome && \
    wget https://raw.githubusercontent.com/datajerk/ctf-write-ups/master/redpwnctf2021/getsome_beginner-generic-pwn-number-0_ret2generic-flag-reader_ret2the-unknown/getsome.py

# resolves issue with gef
RUN apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8 

# install omz theme
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t crunch

WORKDIR /root/workspace
RUN cd /root/workspace
ENTRYPOINT ["/bin/zsh"]

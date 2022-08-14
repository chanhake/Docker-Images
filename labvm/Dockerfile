FROM kalilinux/kali-rolling

MAINTAINER tj <toconnor@fit.edu>

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

# autoupdate dist/missing packages
RUN apt-get clean -y && apt-get update -y && apt-get dist-upgrade -y 
RUN apt-get update --fix-missing -y
RUN apt-get update -y && apt-get upgrade -y 

# apt-get installs
RUN apt-get update -y 
RUN apt-get install -y --ignore-missing afl-* \
    aircrack-ng \
    apt-utils \
    apktool \
    atomicparsley \
    audacity \
    audispd-plugins \
    auditd \
    autoconf \
    autotools-dev \
    automake \
    bandit \
    binutils \
    binwalk \
    bison \
    bsdmainutils \
    build-essential \
    cewl \
    chaosreader \
    chkrootkit \
    cmake \
    cpio \
    crackle \
    dnscat2 \
    elfutils \
    exiftool \
    ffmpeg \
    file \
    flawfinder \
    flex \
    foremost \
    forensics-all \
    g++ \
    gcc \
    gcc-arm-linux-gnueabi \
    gcc-arm-linux-gnueabihf \
    gdb \
    gdb-multiarch \
    gdbserver \
    git \
    gnuradio \
    gqrx-sdr \
    hexedit \
    iptables \
    jadx \
    jq \
    kalibrate-rtl \
    kismet \
    kismet-plugins \
    iputils-ping \
    libevent-dev \
    libbluetooth-dev \
    libedit-dev \
    libgcrypt-dev \
    libpcap-dev \
    libseccomp-dev \
    librtlsdr-dev \
    libssl-dev \
    libtool \
    libusb-1.0-0-dev \
    locales \
    make \
    man \
    mitmproxy \
    nano \
    nasm \
    net-tools \
    ngrep \
    patchelf \ 
    pcapfix \
    pkg-config \
    pngcheck \
    powershell-empire \
    python2 \
    python2-dev \
    python3-dev \
    python3-bandit \
    python3-binwalk \
    python3-pip \
    python3-scapy \
    qemu-system-mipsel \
    qemu-user \
    rfcat \
    rkhunter \
    rpm2cpio \
    ruby \
    ruby-dev \
    sagemath \ 
    shellter \
    silenttrinity \
    #snort \
    sonic-visualiser \
    sox \ 
    sqlite3 \
    sqlmap \
    steghide \
    stegosuite \
    stegsnow \
    strace \
    swig \
    tcpdump \
    tcpflow \
    tcpxtract \
    tempest-for-eliza \
    tmux \
    u-boot-tools \
    veil \
    veil-evasion \
    xxd \
    wget \
    wifite \
    zeek \
    bro-aux \
    zsh \
    zlib1g-dev \
    zstd  --fix-missing && \
    rm -rf /var/lib/apt/lists/*


# python3 pip installs
RUN python3 -m pip install --no-cache-dir \
    alive_progress \
    angr \
    angrop \
    apscheduler \
    autopep8 \
    boofuzz \
    capstone \
    cython \
    keystone-engine \
    log_symbols \
    mobsfscan \
    nuitka \ 
    opencv-python \
    pandas \
    pebble \
    pefile \
    progress \
    pwnscripts \
    pyfiglet \
    pymaat \ 
    pwntools \
    python-magic \
    pyradamsa \
    qiling \
    randomname \
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
    importlib \
    tqdm

# install ruby gems
RUN gem install one_gadget seccomp-tools && \
    rm -rf /var/lib/gems/2.*/cache/*

## crypto installs ##

# install rsactftool (ctfs - rsa problems)
RUN cd /opt/ && git clone https://github.com/Ganapati/RsaCtfTool

RUN cd /opt/ && git clone https://github.com/ius/rsatool && \
    cd rsatool && python3 setup.py install 

## forensics installs ##

# install volatility (memory forensics)
RUN cd /opt/ && \
    wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip && \
    unzip volatility_2.6_lin64_standalone.zip && \
    ln -sf /opt/volatility_2.6_lin64_standalone/volatility_2.6_lin64_standalone /usr/local/bin/volatility

# firmwalker (iot firmware crawler)
RUN cd /opt/ && \
    git clone https://github.com/craigz28/firmwalker.git 

# install DidierStevensSuite (ole parsing)
RUN cd /opt/ && \
    git clone https://github.com/DidierStevens/DidierStevensSuite && \
    chmod +x /opt/DidierStevensSuite/oledump.py && \
    ln -sf /opt/DidierStevensSuite/oledump.py /usr/local/bin/oledump 

# install osquery (hids)
RUN cd /opt/ && \
    wget https://pkg.osquery.io/deb/osquery_4.6.0-1.linux_amd64.deb && \
    dpkg -I osquery_4.6.0-1.linux_amd64.deb

## rf installs ##

# install dump1090 (ads-b monitoring)
RUN cd /opt && \
    git clone https://github.com/antirez/dump1090.git && \
    cd dump1090 && \
    make && \
    ln -sf /opt/dump1090/dump1090 /usr/local/bin/dump109

# install killerbee (zigbee packet analysis)
RUN cd /opt/ && \
    git clone https://github.com/riverloopsec/killerbee && \
    cd killerbee && \
    python2 setup.py install 

# install rfcat (sdr toolkit)
RUN cd /opt/ && \
    git clone https://github.com/atlas0fd00m/rfcat && \
    cd rfcat && \
    sed 's/ipython/#ipython/g' requirements.txt > requirements.mod && \
    mv requirements.mod requirements.txt && \
    python2 setup.py install 

# install z3sec
RUN cd /opt/ && \
    git clone https://github.com/IoTsec/Z3sec/ && \
    cd Z3sec && \
    python2 setup.py install

## stego installs ##

# install stegsolve
RUN cd /opt && \
    wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar && \
    chmod +x stegsolve.jar && \
    mkdir bin && \
    mv stegsolve.jar bin/

# install jsteg (stego tool)
RUN wget -O /usr/local/bin/jsteg \
   https://github.com/lukechampine/jsteg/releases/download/v0.3.0/jsteg-linux-amd64 && \
   chmod +x /usr/local/bin/jsteg
RUN wget -O /usr/local/bin/slink \
   https://github.com/lukechampine/jsteg/releases/download/v0.3.0/slink-linux-amd64 && \
   chmod +x /usr/local/bin/slink

## re installs ##

# install mobsf for android/ioS RE: TODO

# install movobfuscator compiler
RUN cd /opt && \
   git clone https://github.com/xoreaxeaxeax/movfuscator && \
   cd movfuscator && \
   ./build.sh && \
   ./install.sh

# install radare (debugger)
RUN wget https://github.com/radareorg/radare2/releases/download/4.4.0/radare2_4.4.0_amd64.deb && \
    dpkg -i radare2_4.4.0_amd64.deb && rm radare2_4.4.0_amd64.deb

# install rappel for emulateing assembly instructions
RUN cd /opt/ && \
    git clone https://github.com/yrp604/rappel && \
     cd rappel && CC=clang make

## pwn installs ##

# install pwndbg (gdb enhancement)
RUN cd /opt/ && git clone https://github.com/pwndbg/pwndbg && \
  cd pwndbg && \
  ./setup.sh

# install autorop (auto-exploit tool)
RUN cd /opt && git clone https://github.com/mariuszskon/autorop && \
     cd autorop && pip3 install .

# download getsome.py (auto-exploit tool)
RUN cd /opt/ && \
    mkdir getsome && \
    cd getsome && \
    wget https://raw.githubusercontent.com/datajerk/ctf-write-ups/master/redpwnctf2021/getsome_beginner-generic-pwn-number-0_ret2generic-flag-reader_ret2the-unknown/getsome.py

# copy how to heap (shellphish heap examples)
RUN cd /opt/ && \
    git clone --depth 1 https://github.com/shellphish/how2heap how2heap


# install pwninit for patching bins for ctfs     
RUN wget -O /bin/pwninit https://github.com/io12/pwninit/releases/download/3.2.0/pwninit && \
    chmod +x /bin/pwninit 

## some cross-compilation stuff
RUN dpkg --add-architecture armhf && \
    dpkg --add-architecture armel && \
    dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get -y install libssl-dev:armhf libssl-dev:armel libc6:i386 libncurses5:i386 libstdc++6:i386 libc6-dev-i386 && \
    rm -rf /var/lib/apt/lists/*

# install apt-conflicts last
#RUN apt-get install -y gcc-multilib  && \
#   rm -rf /var/lib/apt/lists/*

# resolves issue with local environment
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
FROM aramo
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get --assume-yes \
            --no-install-recommends \
            install debootstrap \
                    debian-archive-keyring \
                    ca-certificates \
                    qemu-user \
                    qemu-user-static \
                    qemu-system-arm \
                    qemu-system-x86 \
                    device-tree-compiler \
                    gcc \
                    gcc-arm-none-eabi \
                    make \
                    git \
                    bc \
                    bzip2 \
                    pigz \
                    bison \
                    flex \
                    python3-dev \
                    python3-pkg-resources \
                    python3-pyelftools \
                    python3-setuptools \
                    swig \
                    parted \
                    e2fsprogs \
                    dosfstools \
                    mtools \
                    pwgen \
                    libssl-dev \
                    libgnutls28-dev \
                    uuid-dev \
                    parallel \
                    ssh \
                    sshpass \
                    unzip && \
    ([ "$(uname -m)" = "aarch64" ] && \
     apt-get --assume-yes \
             install gcc-arm-linux-gnueabihf \
                     gcc-i686-linux-gnu \
                     gcc-x86-64-linux-gnu || :) && \
    ([ "$(uname -m)" = "x86_64" ] && \
     apt-get --assume-yes \
             install gcc-arm-linux-gnueabihf \
                     gcc-aarch64-linux-gnu \
                     gcc-i686-linux-gnu || :) && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /var/log/*.log
ENV PATH="/debimg/scripts:${PATH}"
COPY . /debimg
WORKDIR /debimg

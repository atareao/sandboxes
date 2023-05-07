FROM ubuntu:22.04

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        sudo \
        ca-certificates \
        build-essential \
        automake \
        cmake \
        vim \
        curl \
        wget \
        cargo \
        && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -ms /bin/bash lorenzo && \
    echo "lorenzo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/10-lorenzo

USER lorenzo
WORKDIR /home/lorenzo

RUN cargo install starship --locked

RUN mkdir -p ~/.config && \
    touch ~/.config/starship.toml && \
    echo 'export PATH=~/.cargo/bin:$PATH' >> ~/.bashrc && \
    echo 'eval "$(starship init bash)"' >> ~/.bashrc

CMD ["/bin/bash"]

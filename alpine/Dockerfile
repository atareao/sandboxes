FROM alpine:3.17

RUN apk update && \
    apk upgrade --no-cache && \
    apk add sudo \
            bash \
            ca-certificates \
            vim \
            curl \
            wget \
            && \
    rm -rf /var/cache/apt/* && \
    addgroup -S lorenzo && \
    adduser -Ss /bin/bash lorenzo -G lorenzo && \
    echo "lorenzo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/10-lorenzo

USER lorenzo
WORKDIR /home/lorenzo

RUN mkdir -p ~/.cargo/bin && \
    wget https://github.com/starship/starship/releases/download/v1.14.2/starship-x86_64-unknown-linux-musl.tar.gz && \
    tar xvzf starship-x86_64-unknown-linux-musl.tar.gz && \
    rm starship-x86_64-unknown-linux-musl.tar.gz && \
    mv starship ~/.cargo/bin/

RUN mkdir -p ~/.config && \
    touch ~/.config/starship.toml && \
    echo 'export PATH=~/.cargo/bin:$PATH' >> ~/.bashrc && \
    echo 'eval "$(starship init bash)"' >> ~/.bashrc

CMD ["/bin/bash"]

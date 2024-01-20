FROM alpine:3.18

RUN apk update && \
    apk upgrade --no-cache && \
    apk add sudo \
            bash \
            ca-certificates \
            vim \
            curl \
            wget \
            git \
            neovim \
            gcc \
            g++ \
            cargo \
            make \
	    cmake \
            luajit \
            musl-dev \
            python3 \
            && \
    rm -rf /var/cache/apk/* && \
    addgroup -S nosotros -g 10001 && \
    adduser -Ss /bin/bash yo -G nosotros -u 10001 && \
    echo "yo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/10-yo

USER yo
WORKDIR /home/yo

RUN curl https://sh.rustup.rs -sSf -o install.sh && \
    /bin/bash install.sh -y
    rm install.sh

RUN mkdir -p ~/.cargo/bin && \
    cargo install starship

RUN mkdir -p ~/.config && \
    touch ~/.config/starship.toml && \
    echo 'export PATH=~/.cargo/bin:$PATH' >> ~/.bashrc && \
    /home/yo/.cargo/bin/starship preset pastel-powerline -o ~/.config/starship.toml && \
    echo 'eval "$(starship init bash)"' >> ~/.bashrc


CMD ["/bin/bash"]

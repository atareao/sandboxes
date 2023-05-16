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
            openjdk17 \
            openjdk17-jdk \
            openjdk17-jre \
            openjdk17-src \
            cargo \
            make \
            luajit \
            musl-dev \
            python3 \
            && \
    rm -rf /var/cache/apt/* && \
    addgroup -S nosotros -g 10001 && \
    adduser -Ss /bin/bash yo -G nosotros -u 10001 && \
    echo "yo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/10-yo

USER yo
WORKDIR /home/yo

RUN mkdir -p ~/.cargo/bin && \
    wget https://github.com/starship/starship/releases/download/v1.14.2/starship-x86_64-unknown-linux-musl.tar.gz && \
    tar xvzf starship-x86_64-unknown-linux-musl.tar.gz && \
    rm starship-x86_64-unknown-linux-musl.tar.gz && \
    mv starship ~/.cargo/bin/

RUN mkdir -p ~/.config && \
    touch ~/.config/starship.toml && \
    echo 'export PATH=~/.cargo/bin:$PATH' >> ~/.bashrc && \
    echo 'eval "$(starship init bash)"' >> ~/.bashrc

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim && \
    rm -rf ~/.config/nvim/.gi

CMD ["/bin/bash"]

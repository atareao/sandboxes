FROM archlinux:latest

RUN pacman -Syyu --noconfirm && \
    pacman -S --noconfirm \
            sudo \
            bash \
            ca-certificates \
            vim \
            curl \
            wget \
            && \
    pacman -Scc --noconfirm && \
    rm -rf /var/cache/apt/*
RUN groupadd -g 10001 nosotros && \
    useradd -ms /bin/bash --uid 10001 --gid 10001 yo && \
    echo "yo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/10-yo

USER yo
WORKDIR /home/yo

RUN curl https://sh.rustup.rs -sSf -o install.sh && \
    /bin/bash install.sh -y

RUN mkdir -p ~/.cargo/bin && \
    wget https://github.com/starship/starship/releases/download/v1.14.2/starship-x86_64-unknown-linux-gnu.tar.gz && \
    tar xvzf starship-x86_64-unknown-linux-gnu.tar.gz && \
    rm starship-x86_64-unknown-linux-gnu.tar.gz && \
    mv starship ~/.cargo/bin/

RUN mkdir -p ~/.config && \
    touch ~/.config/starship.toml && \
    echo 'export PATH=~/.cargo/bin:$PATH' >> ~/.bashrc && \
    echo 'eval "$(starship init bash)"' >> ~/.bashrc && \
    /home/yo/.cargo/bin/starship preset pastel-powerline -o ~/.config/starship.toml

CMD ["/bin/bash"]

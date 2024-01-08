default:
    @just --list

build:
    docker build -t atareao/sandbox:ubuntu .

push:
    docker push --all-tags atareao/sandbox

run:
    docker run -it --rm atareao/sandbox:ubuntu

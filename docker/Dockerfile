FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

COPY sources.list /etc/apt/sources.list
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install emacs-nox
RUN apt-get -y install openssh-server
RUN apt-get -y install zsh
RUN apt-get -y install rsync
RUN apt-get -y install openssl
RUN apt-get -y install git
RUN apt-get -y install git-lfs
RUN apt-get -y install build-essential
RUN apt-get -y install cmake
RUN apt-get -y install clang
RUN apt-get -y install golang
RUN apt-get -y install net-tools
RUN apt-get -y install htop
RUN apt-get -y install flex
RUN apt-get -y install bison
RUN apt-get -y install texinfo
RUN apt-get -y install zip
RUN apt-get -y install unzip
RUN apt-get -y install help2man
RUN apt-get -y install libtool
RUN apt-get -y install libtool-bin
RUN apt-get -y install libncurses5-dev
RUN apt-get -y install jq
RUN apt-get -y install libssl-dev
RUN apt-get -y install liblzma-dev
RUN apt-get -y install libreadline-dev
RUN apt-get -y install libsqlite3-dev
RUN apt-get -y install libbz2-dev
RUN apt-get -y install apt-utils
RUN apt-get -y install sudo
RUN apt-get -y install locales
RUN apt-get -y install locales-all
RUN apt-get -y install tzdata
RUN apt-get -y install ca-certificates
RUN apt-get -y install ca-certificates-java
RUN apt-get -y install ca-certificates-mono
RUN apt-get -y install tcl-dev
RUN apt-get -y install tk-dev
RUN apt-get -y install clang-format
RUN apt-get -y install curl
RUN apt-get -y install wget
RUN apt-get -y install lsb-release
RUN apt-get -y install wget
RUN apt-get -y install software-properties-common
RUN apt-get -y install gnupg
RUN apt-get -y update && apt-get -y upgrade

COPY Miniconda3-latest-Linux-x86_64.sh /workspace/
RUN /workspace/Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda
RUN echo ". /opt/conda/bin/activate" >> /root/.bashrc
COPY .condarc /root/
COPY create-conda-env.sh /workspace/
RUN /workspace/create-conda-env.sh
COPY install-pytorch.sh /workspace/
RUN /workspace/install-pytorch.sh
COPY requirements.txt /workspace/
COPY install-requirements.sh /workspace/
RUN cd /workspace/ && /workspace/install-requirements.sh
COPY checkpoints/resnet50-0676ba61.pth /root/.cache/torch/hub/checkpoints/

COPY authorized_keys /root/.ssh/authorized_keys
COPY my_entry.sh /my_entry.sh
RUN mkdir -p /var/run/sshd
EXPOSE 22

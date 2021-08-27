FROM nvidia/cuda:11.4.1-cudnn8-devel-ubuntu18.04

COPY ./github /github

RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && apt update -y && apt install git curl pkg-config zip -y

RUN cd /github/vcpkg && sh ./bootstrap-vcpkg.sh

RUN cd /github/vcpkg && ./vcpkg install opencv4[cuda]
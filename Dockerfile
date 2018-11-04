#FROM tensorflow/tensorflow:1.1.0-devel-gpu-py3
FROM tensorflow/tensorflow:1.1.0-devel-gpu

RUN apt-get update
RUN apt-get install -y vim file wget

COPY ./requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

WORKDIR /opt/silverbrane/deeplab
RUN echo "alias cl='clear;ls'" >> ~/.bashrc

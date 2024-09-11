FROM pytorch/pytorch:2.4.1-cuda12.1-cudnn9-devel

ENV DEBIAN_FRONTEND=noninteractive

COPY requirements.txt /workspace

RUN pip --no-cache-dir install -r /workspace/requirements.txt -i https://mirrors.aliyun.com/pypi/simple

COPY checkpoints/resnet50-0676ba61.pth /root/.cache/torch/hub/checkpoints/

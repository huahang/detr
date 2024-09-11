#!/bin/env sh
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
pip3 install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple

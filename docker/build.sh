#!/bin/sh

if [ -f "$HOME/.ssh/id_rsa.pub" ] ; then
  cp "$HOME/.ssh/id_rsa.pub" authorized_keys
elif [ -f "$HOME/.ssh/id_ed25519.pub" ] ; then
  cp "$HOME/.ssh/id_ed25519.pub" authorized_keys
else
  echo "No public key found in ~/.ssh"
  exit 1
fi

docker build -t detr_dev .

#! /usr/bin/env bash

export PATH=$CONDA_PREFIX/bin:$PATH
cp -rf config-files "$CONDA_PREFIX" && chmod 777 "$CONDA_PREFIX"/config-files/*
cp -rf bin/rMAP "$CONDA_PREFIX"/bin/ && chmod 777 "$CONDA_PREFIX"/bin/rMAP

echo -e "rMAP is all set up!!! Run 'rMAP -h' to confirm."

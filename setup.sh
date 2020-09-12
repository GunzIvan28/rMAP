#! /usr/bin/env bash

export PATH=~/miniconda3/bin:$PATH
cp -rf config-files ../miniconda3/envs/rMAP-1.0/
chmod 777 ../miniconda3/envs/rMAP-1.0/config-files/*
cp -rf bin/rMAP ../miniconda3/envs/rMAP-1.0/bin/
chmod 777 ../miniconda3/envs/rMAP-1.0/bin/rMAP

echo -e "rMAP is all set up!!! Run 'rMAP -h' to confirm."
touch ../clean.sh &
echo "#! /usr/bin/env bash" >../clean.sh
echo "rm -rf rMAP" >>../clean.sh
chmod 777 ../clean.sh
cd
bash clean.sh
